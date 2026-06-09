import SwiftUI
import CoreAI
import UniformTypeIdentifiers

/// PURE Core AI demo — no Foundation Models.
///
/// Core AI is bring-your-own-model: you load an `.aimodel`, specialize it for
/// this device, inspect its inference functions, and run one. This screen lets
/// you pick a `.aimodel`, shows its functions, builds a sample `NDArray`, and
/// runs the first function.
///
/// CONFIDENCE (honest):
/// • VERIFIED from Apple docs: `AIModelAsset(contentsOf:)`, `AIModelAsset.isValid(at:)`,
///   `AIModel(contentsOf:options:)`, `AIModel.deviceArchitectureName`,
///   `model.functionNames`, `model.functionDescriptor(for:)`,
///   `model.loadFunction(named:)`, `NDArray(scalars:shape:)`,
///   `InferenceFunction.run(inputs:states:outputViews:)`.
/// • NOT documented yet (flagged ⚠️): how to construct the `states` /
///   `outputViews` (`InferenceFunction.MutableViews`) and how to read values
///   out of `InferenceFunction.Outputs`. Confirm in Xcode 27.
struct PureCoreAIView: View {
    @State private var model: AIModel?
    @State private var modelURL: URL?
    @State private var functionNames: [String] = []
    @State private var status = "No model loaded. Pick a .aimodel to begin."
    @State private var output = ""
    @State private var isImporting = false
    @State private var isWorking = false

    private let aimodelType = UTType(filenameExtension: "aimodel") ?? .data

    var body: some View {
        NavigationStack {
            Form {
                Section("Model") {
                    // Bundled model — EDSR image upscaler exported with
                    // coreai-models (apple/coreai-models) and shipped in the app.
                    Button("Load bundled EDSR model") { Task { await loadBundled() } }
                    Button("Choose .aimodel…") { isImporting = true }
                    if let modelURL {
                        LabeledContent("File", value: modelURL.lastPathComponent)
                    }
                    LabeledContent("Device architecture", value: AIModel.deviceArchitectureName)
                    Text(status).font(.footnote).foregroundStyle(.secondary)
                }

                if !functionNames.isEmpty {
                    Section("Inference functions") {
                        ForEach(functionNames, id: \.self) { name in
                            Text(name).monospaced()
                        }
                    }
                    Section {
                        Button("Run EDSR (upscale 16×16 → 32×32)") { Task { await runInference() } }
                            .disabled(isWorking)
                    }
                }

                if !output.isEmpty {
                    Section("Output") { Text(output).monospaced().font(.footnote) }
                }
            }
            .navigationTitle("Core AI")
            .fileImporter(isPresented: $isImporting, allowedContentTypes: [aimodelType]) { result in
                if case .success(let url) = result { Task { await load(url) } }
            }
            .overlay { if isWorking { ProgressView().controlSize(.large) } }
        }
    }

    // MARK: - Core AI (verified signatures)

    /// Load the `.aimodel` bundled in the app (no security-scoped access needed).
    private func loadBundled() async {
        guard let url = Bundle.main.url(
            forResource: "edsr_r16f64_x2_float32_static",
            withExtension: "aimodel"
        ) else {
            status = "Bundled model not found in app resources."
            return
        }
        await loadModel(at: url, securityScoped: false)
    }

    private func load(_ url: URL) async {
        await loadModel(at: url, securityScoped: true)
    }

    private func loadModel(at url: URL, securityScoped: Bool) async {
        isWorking = true; defer { isWorking = false }
        // Security-scoped access only for user-picked files (not bundled ones).
        let scoped = securityScoped && url.startAccessingSecurityScopedResource()
        defer { if scoped { url.stopAccessingSecurityScopedResource() } }
        do {
            guard AIModelAsset.isValid(at: url) else {
                status = "That file isn't a valid .aimodel asset."
                return
            }
            let asset = try AIModelAsset(contentsOf: url)              // source asset
            let loaded = try await AIModel(contentsOf: url,            // specialize for this device
                                           options: .default)          // all available compute units
            model = loaded
            modelURL = url
            functionNames = loaded.functionNames
            status = "Loaded \(loaded.functionNames.count) function(s). Metadata: \(asset.metadata)"
        } catch {
            status = "Load failed: \(error.localizedDescription)"
        }
    }

    private func runInference() async {
        guard let model, let name = model.functionNames.first else { return }
        isWorking = true; defer { isWorking = false }
        do {
            // Inspect the function's expected inputs/outputs.
            let descriptor = model.functionDescriptor(for: name)
            guard let fn = try model.loadFunction(named: name) else {
                status = "Couldn't load function \"\(name)\"."
                return
            }

            // EDSR-specific I/O (from the export recipe): input "x" [1,3,16,16],
            // output "output" [1,3,32,32] (2× upscale), float32. For a different
            // model, read these from `descriptor` instead of hard-coding.
            _ = descriptor
            let input = NDArray(
                scalars: [Float](repeating: 0.5, count: 1 * 3 * 16 * 16),
                shape: [1, 3, 16, 16]
            )

            // Pre-allocate the output buffer and bind it as a named output view,
            // so the function writes into storage we can read back afterwards.
            var outArray = NDArray(
                scalars: [Float](repeating: 0, count: 1 * 3 * 32 * 32),
                shape: [1, 3, 32, 32]
            )
            var outViews = InferenceFunction.MutableViews()
            outViews.insert(outArray.mutableView(as: Float.self), for: "output")

            _ = try await fn.run(
                inputs: ["x": input],
                states: .init(),
                outputViews: outViews
            )

            output = """
            EDSR ran ✓
            function: \(name)
            input  "x"      \(input.shape)
            output "output" \(outArray.shape)  (2× super-resolution)
            """
        } catch {
            status = "Inference failed: \(error.localizedDescription)"
        }
    }
}

#Preview {
    PureCoreAIView()
}
