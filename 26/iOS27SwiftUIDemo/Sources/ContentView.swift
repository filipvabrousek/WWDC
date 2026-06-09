import SwiftUI

/// Root tab bar.
///
/// iOS 27 API demonstrated:
/// • `TabRole.prominent` — places a tab in a separate, trailing position of
///   the tab bar (for a primary action like Create/Search). The other tabs
///   stay in their normal group.
struct ContentView: View {
    // Renamed from `Tab` so it doesn't shadow SwiftUI's own `Tab` view —
    // otherwise `Tab("Feed", …)` below would try to construct this enum.
    enum Screen: Hashable { case feed, toolbar, images, ai, alerts }

    @State private var selection: Screen = .feed

    var body: some View {
        TabView(selection: $selection) {
            Tab("Feed", systemImage: "list.bullet", value: Screen.feed) {
                ReorderableSwipeView()
            }
            Tab("Toolbar", systemImage: "slider.horizontal.3", value: Screen.toolbar) {
                ModernToolbarView()
            }
            Tab("Images", systemImage: "photo.on.rectangle", value: Screen.images) {
                CachedImagesView()
            }
            Tab("Core AI", systemImage: "cpu", value: Screen.ai) {
                SuperResolutionView()
            }
            // iOS 27: the prominent role pulls this tab out into its own
            // trailing slot, visually separated from the main group.
            Tab("Create", systemImage: "plus.circle.fill", value: Screen.alerts, role: .prominent) {
                AlertsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
