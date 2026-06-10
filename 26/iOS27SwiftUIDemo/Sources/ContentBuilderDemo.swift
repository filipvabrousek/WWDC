import SwiftUI

/// `@ContentBuilder` (iOS 27) — a `ViewBuilder` alias you can apply to computed
/// properties / closures to assemble *any* content type (here `ToolbarContent`)
/// from multiple statements, including conditionals. It's the unified
/// replacement for type-specific builders like `@ToolbarContentBuilder`.
struct ContentBuilderDemo: View {
    @State private var editing = false

    var body: some View {
        List {
            ForEach(0..<10) { Text("Item \($0)") }
        }
        .navigationTitle("ContentBuilder")
        .navigationBarTitleDisplayMode(.inline)
        // The toolbar content is built by the @ContentBuilder property below —
        // not inline — showing it's reusable, type-agnostic content.
        .toolbar { editingToolbar }
    }

    /// A reusable, conditionally-built block of `ToolbarContent`.
    @ContentBuilder
    private var editingToolbar: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button(editing ? "Done" : "Edit") { editing.toggle() }
        }
        if editing {
            ToolbarItem(placement: .topBarLeading) {
                Button("Select All") {}
            }
            ToolbarItem(placement: .bottomBar) {
                Button("Delete", role: .destructive) {}
            }
        }
    }
}

#Preview {
    NavigationStack { ContentBuilderDemo() }
}
