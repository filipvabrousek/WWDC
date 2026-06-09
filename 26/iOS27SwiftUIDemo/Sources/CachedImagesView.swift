import SwiftUI

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

#Preview {
    CachedImagesView()
}
