import SwiftUI

/// Editor for a `TextDocument`. The document is `@Observable`, so `@Bindable`
/// gives us a two-way binding into its `text`; edits are auto-saved by the
/// DocumentGroup via the document's writer.
struct EditorView: View {
    @Bindable var document: TextDocument

    // DocumentGroup decides when to autosave based on the UndoManager. A
    // reference-type (@Observable) document doesn't auto-mark itself dirty,
    // so we register an undo action on each edit — that flags the document
    // changed and triggers snapshot() → writer.write().
    @Environment(\.undoManager) private var undoManager

    @State private var showExporter = false

    var body: some View {
        NavigationStack {
            TextEditor(text: $document.text)
                .font(.body.monospaced())
                .padding(8)
                .onChange(of: document.text) { oldValue, _ in
                    undoManager?.registerUndo(withTarget: document) { doc in
                        doc.text = oldValue
                    }
                }
                .navigationTitle("Document")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Export", systemImage: "square.and.arrow.up") {
                            showExporter = true
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(document.text.count) characters")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
                // iOS 27: export a WritableDocument straight to disk.
                .fileExporter(
                    isPresented: $showExporter,
                    document: document,
                    contentType: .plainText,
                    defaultFilename: "Untitled"
                ) { result in
                    // result: Result<URL, Error>
                    if case .failure(let error) = result {
                        print("Export failed:", error)
                    }
                }
        }
    }
}
