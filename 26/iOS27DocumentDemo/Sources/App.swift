import SwiftUI

/// Document-based app built on iOS 27's `ReadableDocument`/`WritableDocument`.
///
/// The new `DocumentGroup(allowCreating:editor:makeDocument:)` initializer:
///   • `editor` receives the `@Observable` document **directly** (no Binding /
///     FileDocumentConfiguration wrapper like the legacy API).
///   • `makeDocument` is a separate async-throwing closure that creates a blank
///     document for the "new file" flow. Opening an existing file goes through
///     the document's reader → apply(snapshot:) instead.
@main
struct iOS27DocumentDemoApp: App {
    var body: some Scene {
        DocumentGroup(allowCreating: true) { document in
            EditorView(document: document)
        } makeDocument: { configuration, context in
            // New, empty document. (configuration: URLDocumentConfiguration,
            // context: DocumentCreationContext — both unused for a blank doc.)
            TextDocument()
        }
    }
}
