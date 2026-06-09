import SwiftUI

/// Reordering + swipe actions in a NON-List container.
///
/// iOS 27 APIs demonstrated:
/// • `DynamicViewContent.reorderable()` — drag-and-drop reordering for a
///   `ForEach` in ANY container (here a `LazyVStack`, not a `List`).
/// • `View.reorderContainer(for:_:)` — the container declares the element type
///   and receives a `difference` to apply to the backing collection.
/// • `View.swipeActions(edge:allowsFullSwipe:content:)` — swipe actions are
///   no longer List-only; they work in scroll views, stacks, grids, etc.
/// • `.glassEffect(in:)` — Liquid Glass material (introduced iOS 26, refined
///   in iOS 27) so the rows read as floating glass cards.
struct ReorderableSwipeView: View {
    // The reorder element MUST be Identifiable (reorderContainer requires it),
    // so we back the list with a small struct instead of a bare String.
    struct Item: Identifiable, Hashable {
        let id = UUID()
        var title: String
    }

    @State private var items: [Item] = (1...8).map { Item(title: "Item \($0)") }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(items) { item in   // Identifiable → no `id:` needed
                        rowLabel(item)
                            // iOS 27: swipe actions outside of List.
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    withAnimation { items.removeAll { $0.id == item.id } }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                    // iOS 27: makes this ForEach drag-reorderable.
                    .reorderable()
                }
                .padding()
            }
            // iOS 27: coordinates swipe-action dismissal + mutual exclusion
            // across rows (one open at a time, dismiss on scroll / tap-outside).
            // A `List` does this automatically; outside one you opt in here.
            .swipeActionsContainer()
            // iOS 27: declare the (Identifiable) element type; the closure hands
            // you a `ReorderDifference` and YOU mutate the backing collection.
            // `ReorderDifference` exposes:
            //   • sources: [Item.ID]          — ids being moved
            //   • destination.position        — .before(id) | .end
            .reorderContainer(for: Item.self) { difference in
                apply(difference)
            }
            .navigationTitle("Feed")
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

    private func rowLabel(_ item: Item) -> some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .foregroundStyle(.secondary)
            Text(item.title)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        // Liquid Glass card.
        .glassEffect(in: .rect(cornerRadius: 16))
    }
}

#Preview {
    ReorderableSwipeView()
}
