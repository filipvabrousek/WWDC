## .reordable, .reorderContainer

```swift
import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
}

struct MyDemo: View {
    @State var items: [Item] = (1...8).map {Item(name: "\($0)")}
    
    var body: some View {
        ScrollView {
            ForEach(items){ item in
                HStack {
                    Image(systemName: "sun.min.fill")
                    Text("Hello \(item.name)")
                }.frame(width: 300, height: 400)
                .background(.orange)
                .padding()
            }.reorderable()
        }.reorderContainer(for: Item.self) { difference in
            apply(difference)
        }
    }
    
    /// Translate a `ReorderDifference` into a mutation of `items`.
    /// Pull the moved elements out, then re-insert them at the destination
    /// (before a given item, or at the end).
    private func apply(_ difference: ReorderDifference<Item.ID, some Any>) {
        let movingIDs = Set(difference.sources)
        let moved = items.filter { movingIDs.contains($0.id) }        // keep current order
        var remaining = items.filter { !movingIDs.contains($0.id) }

        let insertIndex: Int
        switch difference.destination.position {
        case .before(let anchorID):
            insertIndex = remaining.firstIndex { $0.id == anchorID } ?? remaining.endIndex
        case .end:
            insertIndex = remaining.endIndex
        @unknown default:
            insertIndex = remaining.endIndex
        }

        remaining.insert(contentsOf: moved, at: insertIndex)
        withAnimation { items = remaining }
    }
}

```


## swipeActionsContainer

```swift

struct SwipeTest: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<3){ item in
                    Text("Hello \(item)")
                        .frame(width: 300, height: 400)
                        .background(.orange)
                        .padding()
                        .swipeActions {
                            Button("WOW"){
                                
                            }
                        }
                }
                
               
              
            }
        }.swipeActionsContainer() // 233539 make mutual exclusion during swipe actions
    }
    
}
```


##  .asyncImageURLSession()

```swift
/// Locally-cached async images.
///
/// iOS 27 APIs demonstrated:
/// • `AsyncImage.init(request:scale:content:placeholder:)` — load an image
///   from a `URLRequest` (so you control cache policy, headers, etc.).
/// • `View.asyncImageURLSession(_:)` — supply the `URLSession` whose
///   configuration (disk cache, etc.) `AsyncImage` should use, so downloads
///   are cached locally instead of re-fetched on every appearance.
struct CachedImagesView: View {
    private let urls: [URL] = (1...12).compactMap {
        URL(string: "https://picsum.photos/seed/h7-\($0)/400/400")
    }

    private let columns = [GridItem(.adaptive(minimum: 110), spacing: 12)]

    // A session with a generous on-disk cache.
    private static let cachingSession: URLSession = {
        let config = URLSessionConfiguration.default
        config.urlCache = URLCache(memoryCapacity: 16 << 20,   // 16 MB
                                   diskCapacity: 256 << 20)     // 256 MB
        config.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: config)
    }()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(urls, id: \.self) { url in
                        AsyncImage(request: URLRequest(url: url), scale: 1) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 110, height: 110)
                        .clipShape(.rect(cornerRadius: 14))
                    }
                }
                .padding()
            }
            .navigationTitle("Images")
            // iOS 27: route all AsyncImage loads in this subtree through our
            // caching session.
            .asyncImageURLSession(Self.cachingSession)
        }
    }
}

```



## ToolbarOverflowMenu
## toolbarMinimizeBehavior

```swift
struct NiceToolbar: View {
    var body: some View {
        NavigationStack {
            
            ScrollView {
                ForEach(0..<1000){_ in
                    
                    
                    Text("Wow")
                }
            }.navigationTitle("Hello")
            
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    
          
                    Button("Save") {}
                }
                .visibilityPriority(.high) // ⚠️ verify: applied to ToolbarContent in Xcode 27
                
                
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {}
                }
                .visibilityPriority(.high) // ⚠️ verify: applied to ToolbarContent in Xcode 27
                
                ToolbarItem(placement: .topBarPinnedTrailing) {  // far RIGHT, pinned
                        Button { } label: { Image(systemName: "star") }
                    }
                
                // Why merged up?
                // 230221 cool
                
                ToolbarOverflowMenu {
                    Button("First") { // 225733 cool!
                        
                    }
                    
                    Button("Second") { // 225733 cool!
                        
                    }
                    
                    Button("Third") { // 225733 cool!
                        
                    }
                }
            }.toolbarMinimizeBehavior(.onScrollDown, for: .navigationBar) // 10/06 00:43 cool
        }
    }
}


```
