import SwiftUI

/// Three more iOS 27 SwiftUI APIs:
/// • `GestureInputKinds` — restrict a gesture to specific input sources (here:
///   Apple Pencil only). Values confirmed from Apple docs; the attach modifier
///   `.gestureInputKinds(_:)` is best-effort — verify in Xcode 27.
/// • `alert(error:actions:message:)` / `alert(_:item:actions:)` — the new alert
///   overloads (present from an Error / an optional Identifiable).
/// • `NavigationTransition.crossFade` — a sheet that fades in over content.
struct MoreIOS27View: View {
    struct UploadError: LocalizedError {
        var errorDescription: String?   { "Upload failed." }
        var recoverySuggestion: String? { "Check your connection and retry." }
    }
    struct Doc: Identifiable { let id = UUID(); let name: String }

    @State private var error: UploadError?
    @State private var docToDelete: Doc?
    @State private var showSheet = false

    var body: some View {
        NavigationStack {
            List {
                Section("Gestures — GestureInputKinds") {
                    NavigationLink("Apple Pencil-only canvas") {
                        PencilCanvas()
                    }
                }
                Section("Alerts — iOS 27 overloads") {
                    Button("Trigger error alert")    { error = UploadError() }
                    Button("Confirm delete (item)")  { docToDelete = Doc(name: "Report.pdf") }
                }
                Section("Transitions") {
                    Button("Cross-fade sheet")       { showSheet = true }
                }
                Section("Result builders — @ContentBuilder") {
                    NavigationLink("Reusable toolbar content") {
                        ContentBuilderDemo()
                    }
                }
            }
            .navigationTitle("More iOS 27")
            // iOS 27: present straight from an Error binding (framework clears
            // it on dismiss). actions/message closures receive the error value.
            .alert(error: $error) { _ in
                Button("OK", role: .cancel) {}
            } message: { err in
                if let s = err.recoverySuggestion { Text(s) }
            }
            // iOS 27: present bound to an optional Identifiable item.
            .alert("Delete \(docToDelete?.name ?? "")?", item: $docToDelete) { doc in
                Button("Delete", role: .destructive) { docToDelete = nil }
                Button("Cancel", role: .cancel) { docToDelete = nil }
            }
            // iOS 27: fade the sheet in over content instead of sliding up.
            .sheet(isPresented: $showSheet) {
                VStack(spacing: 12) {
                    Image(systemName: "sparkles").font(.largeTitle)
                    Text("This sheet faded in").font(.title3)
                }
                .presentationDetents([.medium])
                .navigationTransition(.crossFade) // 100200 cool 10/06/26
            }
        }
    }
}

/// Draws only with Apple Pencil — finger/pointer input is ignored.
struct PencilCanvas: View {
    @State private var points: [CGPoint] = []

    var body: some View {
        Canvas { ctx, _ in
            var path = Path()
            if let first = points.first {
                path.move(to: first)
                for p in points.dropFirst() { path.addLine(to: p) }
            }
            ctx.stroke(path, with: .color(.blue), lineWidth: 4)
        }
        .background(.gray.opacity(0.12))
        .overlay(alignment: .top) {
            Text("Draw with Apple Pencil — finger does nothing")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.top, 8)
        }
        // iOS 27: restrict this drag to pencil input only — `inputKinds` is an
        // INITIALIZER parameter, not a modifier: DragGesture(…, inputKinds:).
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .local, inputKinds: .pencil)
                .onChanged { points.append($0.location) }
        )
        .navigationTitle("Pencil only")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Clear") { points.removeAll() }
            }
        }
    }
}

#Preview {
    MoreIOS27View()
}
