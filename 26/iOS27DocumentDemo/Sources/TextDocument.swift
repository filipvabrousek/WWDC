import SwiftUI
import Foundation
import UniformTypeIdentifiers

/// iOS 27 document model using the new `ReadableDocument` / `WritableDocument`
/// protocols (the modern replacement for `FileDocument` / `ReferenceFileDocument`).
///
/// The new model splits responsibilities:
///   • The document is an `@Observable` class holding live state (`text`).
///   • A `DocumentReader` reads a `Snapshot` from the file URL.
///   • A `DocumentWriter` writes a `Snapshot` back to the file URL.
///   • `apply(snapshot:previous:)` loads a read snapshot into the model;
///     `snapshot(contentType:)` produces one to save.
///
/// Signatures here are taken verbatim from Apple's iOS 27 docs. Spots I
/// couldn't fully verify are marked `// ⚠️` — confirm with Xcode 27.

// MARK: - Reader (URL -> String snapshot)

struct PlainTextReader: DocumentReader {
    typealias Source = URL
    typealias Snapshot = String

    func read(from source: sending URL, progress: consuming Subprogress) async throws -> sending String {
        let data = try Data(contentsOf: source)
        let s = String(decoding: data, as: UTF8.self)
        print("📄 READ \(data.count) bytes from \(source.lastPathComponent): \"\(s.prefix(40))\"")
        return s
    }
}

// MARK: - Writer (String snapshot -> URL)

struct PlainTextWriter: DocumentWriter {
    typealias Destination = URL
    typealias Snapshot = String

    func write(
        content: sending String,
        to destination: sending URL,
        previous: sending String?,
        progress: consuming Subprogress
    ) async throws {
        print("💾 WRITE \(content.utf8.count) bytes to \(destination.lastPathComponent): \"\(content.prefix(40))\"")
        // Write IN PLACE (no .atomic). The framework hands us a coordinated
        // destination URL and handles the safe swap itself; writing atomically
        // here renames a temp file over the original, changing its identity —
        // which invalidates the document browser's bookmark and makes the file
        // vanish from Recents.
        try Data(content.utf8).write(to: destination)
    }
}

// MARK: - Document

@Observable
final class TextDocument: ReadableDocument, WritableDocument {
    var text: String

    init(text: String = "") { self.text = text }

    // Associated types — declared explicitly because the `sending` return
    // values on reader()/writer() block Swift's inference of Reader/Writer.
    typealias Reader = PlainTextReader
    typealias Writer = PlainTextWriter

    static var readableContentTypes: [UTType] { [.plainText] }
    static var writableContentTypes: [UTType] { [.plainText] }

    // --- Read side ---
    // `configuration` is a DocumentReadConfiguration (exposes the file URL,
    // content type, etc.); unused here.
    func reader(configuration: sending DocumentReadConfiguration) -> sending PlainTextReader {
        PlainTextReader()
    }

    func apply(snapshot: sending String, previous: sending String?) async throws {
        print("📥 APPLY snapshot: \"\(snapshot.prefix(40))\"")
        text = snapshot
    }

    // --- Write side ---
    func snapshot(contentType: UTType) async throws -> sending String {
        print("📤 SNAPSHOT requested: \"\(text.prefix(40))\"")
        return text
    }

    func writer(configuration: sending DocumentWriteConfiguration) -> sending PlainTextWriter {
        PlainTextWriter()
    }
}
