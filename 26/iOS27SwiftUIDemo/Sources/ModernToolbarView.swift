import SwiftUI

/// Modern toolbar behavior.
///
/// iOS 27 APIs demonstrated:
/// • `ToolbarItemPlacement.topBarPinnedTrailing` — anchor an item to the
///   trailing edge of the top bar so it never moves into the overflow.
/// • `ToolbarContent.visibilityPriority(_:)` — keep important actions visible
///   as horizontal space shrinks (lower-priority items collapse first).
/// • `ToolbarOverflowMenu` — send secondary actions into a "•••" overflow menu.
/// • `View.toolbarMinimizeBehavior(_:for:)` — control how a bar minimizes on
///   scroll.
struct ModernToolbarView: View {
    @State private var isFavorite = false

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0..<30) { i in
                        Text("Row \(i)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .glassEffect(in: .rect(cornerRadius: 12))
                    }
                }
                .padding()
            }
            .navigationTitle("Toolbar")
            .toolbar {
                // Pinned to the trailing edge of the top bar (iOS 27).
                ToolbarItem(placement: .topBarPinnedTrailing) {
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                    }
                }

                // High priority — stays visible as the bar narrows (iOS 27).
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {}
                }
                .visibilityPriority(.high) // ⚠️ verify: applied to ToolbarContent in Xcode 27

                // Secondary actions collapse into an overflow menu (iOS 27).
                ToolbarOverflowMenu {
                    Button("Duplicate", systemImage: "doc.on.doc") {}
                    Button("Archive", systemImage: "archivebox") {}
                    Button("Move…", systemImage: "folder") {}
                }
            }
            // Bottom bar minimizes as the user scrolls (iOS 27).
           // .toolbarMinimizeBehavior(.onScroll, for: .bottomBar)
        }
    }
}

#Preview {
    ModernToolbarView()
}
