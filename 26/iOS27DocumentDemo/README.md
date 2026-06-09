# iOS 27 Document Demo

A document-based app showcasing iOS 27's **new document protocols** from Apple's
[SwiftUI updates](https://developer.apple.com/documentation/updates/swiftui):
`ReadableDocument`, `WritableDocument`, `DocumentReader`, `DocumentWriter`,
`URLDocumentConfiguration`, and `fileExporter`.

## Requirements
- **Xcode 27** (iOS 27 SDK)
- [XcodeGen](https://github.com/yonaskolb/XcodeGen): `brew install xcodegen`

## Build
```bash
cd iOS27DocumentDemo
xcodegen generate
open iOS27DocumentDemo.xcodeproj   # Xcode 27 → run on an iOS 27 sim
```
The app opens the system document browser; create a new plain-text file or open
an existing one, edit it, and use **Export** to save a copy elsewhere.

## What's new vs the legacy document API

| Legacy (`FileDocument`) | iOS 27 |
|---|---|
| One value-type conforming to `FileDocument` | `@Observable` class conforming to **`ReadableDocument`** + **`WritableDocument`** |
| `init(configuration:)` reads `Data`/`FileWrapper` inline | A dedicated **`DocumentReader`** (`read(from: URL …) async throws -> Snapshot`) + `apply(snapshot:previous:)` |
| `fileWrapper(configuration:)` writes inline | A dedicated **`DocumentWriter`** (`write(content:to: URL …)`) + `snapshot(contentType:)` |
| `DocumentGroup(newDocument:editor:)` | **`DocumentGroup(allowCreating:editor:makeDocument:)`** — `editor` gets the document directly; `makeDocument` is async/throws |
| Reads/writes via `FileWrapper` | Can read/write **directly from a file `URL`** (`Reader.Source == URL`) |

## Files
| File | Role |
|---|---|
| `App.swift` | `@main` + `DocumentGroup(allowCreating:editor:makeDocument:)` |
| `TextDocument.swift` | `@Observable` doc + `PlainTextReader` / `PlainTextWriter` (URL ⇄ String) |
| `EditorView.swift` | `TextEditor` bound to the doc + `fileExporter` |

## Honesty note
These APIs shipped at **WWDC 2026**. Signatures here come from Apple's docs, but
a few are inferred and marked `// ⚠️` in source:
- `WriteConfiguration`'s concrete type (assumed `URLDocumentConfiguration`)
- exact use of `Subprogress` and `DocumentCreationContext`
- whether protocol-requirement `sending` annotations must be repeated in conformances

Let Xcode 27 autocomplete confirm these. If you see `Cannot find type …` /
`cannot conform to FileDocument` errors in an editor using a **pre-iOS-27 SDK**,
that's the old SDK missing the new symbols — not a code bug.
