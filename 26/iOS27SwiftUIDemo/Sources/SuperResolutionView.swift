import SwiftUI
import PhotosUI
import CoreAI

/// Real 2× super-resolution with Core AI.
///
/// Pick a photo → resize to an N×N input → run the bundled DYNAMIC EDSR model
/// (`edsr_r16f64_x2_float32_dynamic.aimodel`, exported with apple/coreai-models)
/// → get a 2N×2N output → show before/after.
///
/// EDSR I/O (from the export recipe): input "x" [1,3,H,W] float32 in [0,1],
/// output "output" [1,3,2H,2W]. Dynamic dims allow H,W in 8…256.
struct SuperResolutionView: View {
    private let inputSide = 128            // 128×128 in → 256×256 out (within 8…256)
    private var outputSide: Int { inputSide * 2 }

    @State private var model: AIModel?
    @State private var pickerItem: PhotosPickerItem?
    @State private var lowRes: UIImage?
    @State private var upscaled: UIImage?
    @State private var status = "Loading model…"
    @State private var isWorking = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    PhotosPicker(selection: $pickerItem, matching: .images) {
                        Label("Pick a photo", systemImage: "photo.badge.plus")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .glassEffect(in: .rect(cornerRadius: 14))
                    }
                    .disabled(model == nil || isWorking)

                    if let lowRes, let upscaled {
                        comparison(lowRes, upscaled)
                    }

                    Text(status)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            .navigationTitle("Super-Resolution")
            .overlay { if isWorking { ProgressView().controlSize(.large) } }
            .task { await loadModel() }
            .onChange(of: pickerItem) { _, item in
                guard let item else { return }
                Task { await process(item) }
            }
        }
    }

    private func comparison(_ low: UIImage, _ high: UIImage) -> some View {
        VStack(spacing: 12) {
            captioned(low,  "Input \(inputSide)×\(inputSide)")
            Image(systemName: "arrow.down")
            captioned(high, "EDSR 2× → \(outputSide)×\(outputSide)")
        }
    }

    private func captioned(_ image: UIImage, _ caption: String) -> some View {
        VStack(spacing: 4) {
            Image(uiImage: image)
                .interpolation(.none)                 // show true pixels, no smoothing
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 256)
                .clipShape(.rect(cornerRadius: 12))
            Text(caption).font(.caption).foregroundStyle(.secondary)
        }
    }

    // MARK: - Core AI

    private func loadModel() async {
        guard model == nil else { return }
        guard let url = Bundle.main.url(forResource: "edsr_r16f64_x2_float32_dynamic",
                                        withExtension: "aimodel") else {
            status = "Bundled dynamic EDSR model not found."
            return
        }
        do {
            model = try await AIModel(contentsOf: url, options: .default)
            status = "Model ready. Pick a photo to upscale."
        } catch {
            status = "Model load failed: \(error.localizedDescription)"
        }
    }

    private func process(_ item: PhotosPickerItem) async {
        guard let model else { return }
        isWorking = true; defer { isWorking = false }
        status = "Processing…"
        do {
            // 1. Load the picked image.
            guard let data = try await item.loadTransferable(type: Data.self),
                  let picked = UIImage(data: data),
                  let cg = picked.cgImage else {
                status = "Couldn't read the selected image."
                return
            }

            // 2. Downscale to the model's input size and build a CHW [0,1] NDArray.
            guard let smallCG = resizedCGImage(cg, to: inputSide) else {
                status = "Resize failed."; return
            }
            lowRes = UIImage(cgImage: smallCG)
            upscaled = nil
            let input = ndArray(from: smallCG, side: inputSide)

            // 3. Run EDSR.
            guard let fn = try model.loadFunction(named: model.functionNames.first ?? "main") else {
                status = "No inference function."; return
            }
            var outArray = NDArray(
                scalars: [Float](repeating: 0, count: 3 * outputSide * outputSide),
                shape: [1, 3, outputSide, outputSide]
            )
            var outViews = InferenceFunction.MutableViews()
            outViews.insert(outArray.mutableView(as: Float.self), for: "output")
            _ = try await fn.run(inputs: ["x": input], states: .init(), outputViews: outViews)

            // 4. Convert the output tensor back to an image.
            upscaled = image(from: outArray.view(as: Float.self), side: outputSide)
            status = upscaled == nil ? "Couldn't read output tensor."
                                     : "Upscaled \(inputSide)×\(inputSide) → \(outputSide)×\(outputSide) on-device."
        } catch {
            status = "Inference failed: \(error.localizedDescription)"
        }
    }

    // MARK: - Image <-> NDArray

    /// CHW, row-major, RGB normalized to [0,1] — matches the EDSR export.
    private func ndArray(from cg: CGImage, side: Int) -> NDArray {
        let rgba = rgbaBytes(cg, side: side)
        let plane = side * side
        var planar = [Float](repeating: 0, count: 3 * plane)
        for i in 0..<plane {
            planar[0 * plane + i] = Float(rgba[i * 4 + 0]) / 255   // R
            planar[1 * plane + i] = Float(rgba[i * 4 + 1]) / 255   // G
            planar[2 * plane + i] = Float(rgba[i * 4 + 2]) / 255   // B
        }
        return NDArray(scalars: planar, shape: [1, 3, side, side])
    }

    /// CHW [0,1] tensor view -> UIImage.
    private func image(from view: NDArray.View<Float>, side: Int) -> UIImage? {
        guard let span = view.contiguousElements else { return nil }
        let plane = side * side
        var rgba = [UInt8](repeating: 255, count: plane * 4)
        for i in 0..<plane {
            func channel(_ c: Int) -> UInt8 {
                UInt8(max(0, min(255, span[c * plane + i] * 255)))
            }
            rgba[i * 4 + 0] = channel(0)
            rgba[i * 4 + 1] = channel(1)
            rgba[i * 4 + 2] = channel(2)
        }
        return rgba.withUnsafeMutableBytes { raw -> UIImage? in
            guard let ctx = CGContext(
                data: raw.baseAddress, width: side, height: side,
                bitsPerComponent: 8, bytesPerRow: side * 4,
                space: CGColorSpaceCreateDeviceRGB(),
                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
            ), let cg = ctx.makeImage() else { return nil }
            return UIImage(cgImage: cg)
        }
    }

    private func resizedCGImage(_ cg: CGImage, to side: Int) -> CGImage? {
        guard let ctx = CGContext(
            data: nil, width: side, height: side,
            bitsPerComponent: 8, bytesPerRow: side * 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        ) else { return nil }
        ctx.interpolationQuality = .high
        // center-crop to square, then scale to side×side
        let w = cg.width, h = cg.height, m = min(w, h)
        let cropped = cg.cropping(to: CGRect(x: (w - m) / 2, y: (h - m) / 2, width: m, height: m)) ?? cg
        ctx.draw(cropped, in: CGRect(x: 0, y: 0, width: side, height: side))
        return ctx.makeImage()
    }

    private func rgbaBytes(_ cg: CGImage, side: Int) -> [UInt8] {
        var bytes = [UInt8](repeating: 0, count: side * side * 4)
        bytes.withUnsafeMutableBytes { raw in
            if let ctx = CGContext(
                data: raw.baseAddress, width: side, height: side,
                bitsPerComponent: 8, bytesPerRow: side * 4,
                space: CGColorSpaceCreateDeviceRGB(),
                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
            ) {
                ctx.draw(cg, in: CGRect(x: 0, y: 0, width: side, height: side))
            }
        }
        return bytes
    }
}

#Preview {
    SuperResolutionView()
}
