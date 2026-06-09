# iOS 27 SwiftUI Demo

A small SwiftUI app demonstrating APIs from Apple's official
[SwiftUI updates — iOS/iPadOS 27 (June 2026)](https://developer.apple.com/documentation/updates/swiftui).

## Requirements
- **Xcode 27** (iOS 27 SDK). The APIs below do not exist in earlier SDKs.
- [XcodeGen](https://github.com/yonaskolb/XcodeGen): `brew install xcodegen`

## Build
```bash
cd iOS27SwiftUIDemo
xcodegen generate
open iOS27SwiftUIDemo.xcodeproj
# select an iOS 27 simulator and Run
```

## What each screen shows

| Screen | File | iOS 27 APIs |
|---|---|---|
| **Feed** | `ReorderableSwipeView.swift` | `DynamicViewContent.reorderable()`, `View.reorderContainer(for:isEnabled:move:)`, `swipeActions` in a non-`List` container, `.glassEffect(in:)` |
| **Toolbar** | `ModernToolbarView.swift` | `ToolbarItemPlacement.topBarPinnedTrailing`, `ToolbarContent.visibilityPriority(_:)`, `ToolbarOverflowMenu`, `toolbarMinimizeBehavior(_:for:)` |
| **Images** | `CachedImagesView.swift` | `AsyncImage(request:scale:content:placeholder:)`, `View.asyncImageURLSession(_:)` |
| **Create** (prominent tab) | `AlertsView.swift` | `TabRole.prominent`, `alert(error:actions:message:)`, `alert(_:item:actions:)`, `buttonStyle(.glass)` |

## Honesty note
These APIs shipped at **WWDC 2026 (this week)**. The API *names* come verbatim
from Apple's updates index; a few exact closure signatures are inferred and
marked `// ⚠️ verify signature in Xcode 27` in the source. If the compiler
disagrees on an argument label, trust Xcode 27 autocomplete over these files.

If you open these files in an editor using a **pre-iOS-27 SDK**, you'll see
"cannot find … / has no member …" errors — that's the old SDK missing the new
symbols, not a bug in the code. They compile under the iOS 27 SDK.

## Other notable iOS 27 SwiftUI additions (not in this demo)
From the same updates page — easy to add next:
- `ContentBuilder` — unified replacement for `ToolbarContentBuilder` / `CommandsBuilder`.
- `ReadableDocument` / `WritableDocument` / `DocumentReader` / `DocumentWriter` — URL-based document apps.
- `@State` macro (Xcode 27 builds `@State` via the `State()` macro).
- Gesture input-source control via `GestureInputKinds` on `DragGesture`, `TapGesture`, etc.
