//
//  MyDemo.swift
//  iOS27SwiftUIDemo
//
//  Created by Filip Vabroušek on 8/6/26.
//

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
