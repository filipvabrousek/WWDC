//
//  MyDemo.swift
//  iOS27SwiftUIDemo
//
//  Created by Filip Vabroušek on 8/6/26.
//

import SwiftUI
import Photos

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



// Cool 225647


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



// 10/06/26
struct SidebarFoot: View { // for multi-window
    @Environment(\.appearsActive) private var appears // 214015
    
    var body: some View {
        Text("Hello")
            .opacity(appears ? 1 : 0.5)
    }
}



struct CommandViews: View { // for multi-window
    var body: some View {
       Label("Hello", systemImage: "sun.min.fill")
            .labelStyle(.titleAndIcon) // 214920
    }
}



struct Itema: Identifiable {
    let id = UUID()
    var name: String = ""
}



struct ConfDia: View { // for multi-window
    @State var items: [Itema] = [
        .init(name: "Hello"),
        .init(name: "World")
    ]

    @State var itemToDelete: Itema?
    
    var body: some View {
        ForEach(items){ item in
            Text(item.name)
                .onTapGesture {
                    itemToDelete = item
                }
        }.confirmationDialog("Delete", item: $itemToDelete){ item in
            Button("Delete \(item.name)", role: .destructive) {
                               items.removeAll { $0.id == item.id }
                           } // 221346 very cool
        }
    }
}



struct MenuNice: View {
    var body: some View {
        Menu("A") {
            Button("A") {
                print("A")
            }
            Button("B") {
                print("B")
            }
            Button("C") {
                print("C")
            }.onMenuItemHighlight { high in // 221548 cool
                print("HIGH \(high)")
            }
        }
    }
}




struct Coolp: View {
    var body: some View {
        Text("Nice!")
            .ignoresSafeArea(edges: .all, alignment: .bottomLeading) // 222234
    }
}





struct Tapper: View {
    var body: some View {
        Text("Nice!") // 222524 pencil
            .onTapGesture(inputKinds: .pencil, perform: { coord in
                print(coord.x * coord.y)
            })
    }
}




struct PressChange: View {
    @State var kill = 0
    
    var body: some View {
        Text("Nice!") // 222524 pencil
            .onLongPressGesture {
                print("Hello")
              
            } onPressingChanged: { change in
                kill += 1
                
                if kill > 1 {
                    print("Changed")
                }
            }
    }
}




struct ScaleDelta: View {
    var body: some View {
        Text("Hello")
            .font(.largeTitle)
            .gesture(MagnificationGesture(minimumScaleDelta: 0.9)) // 224118 arg
    }
}



import PhotosUI

struct PhotosMeta: View {
    @State private var selection: PhotosPickerItem?
    @State private var picked: Image?

    var body: some View {
        VStack(spacing: 16) {
            PhotosPicker("Pick a photo", selection: $selection, matching: .images)
                // Strip caption metadata from the picked item before your app
                // receives it. It's an OptionSet — combine if you want:
                //   .photosPickerMetadataOptions([.removeCaptions])
                .photosPickerMetadataOptions(.removeCaptions)

            picked?
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 300)
                .clipShape(.rect(cornerRadius: 12))
        }
        .padding()
        .onChange(of: selection) { _, item in
            guard let item else { return }
            Task {
                if let data = try? await item.loadTransferable(type: Data.self),
                   let ui = UIImage(data: data) {
                    picked = Image(uiImage: ui)
                }
            }
        }
    }
}


// 230238 saw shareText


// 221812 what?
// Update the Info.plist: Support for all orientations will soon be required.




struct PhotosShared: View {
    @State var isp = false // 224348
    @State var ispa = false // 224348
    @State var ispc = false // 224348
    var photoLib = PHPhotoLibrary.shared()
    var items = [PhotosPickerItem]()
    
    var body: some View {
        Button("Wow"){
            isp = true
        }.photosSharedAlbumCreationSheet(isPresented: $isp, photoLibrary: photoLib) // 2250101. album not shown?
        
      
        Button("Wow"){ // freezes
            ispa = true
        }.photosSharedAlbumCustomizationSheet(isPresented: $ispa, albumIdentifier: "a", photoLibrary: photoLib) // 2250101. album not shown?
        
        
        
        Button("Wow"){ // freezes
            ispc = true
            // ???
        }.photosSharedAlbumPostingSheet(isPresented: $ispc, items: items, photoLibrary: photoLib) //234102
    }
}


import StoreKit

struct Redempt: View {
    @State var off = false
    
    var body: some View {
        Button("Redemp"){
            off.toggle()
        }.offerCodeRedemption(options: [], isPresented: $off) { res in // 230812
            print("Loop")
        }
    }
} // 232703 cool redempt, ign-in requested




import MusicKit // 231002 cool


struct Picka: PickableMusicItem {
    let id: MusicItemID
    // 231807
    
}

struct MPicker: View {
    @State var show = false
    @State var sel = [Song]() // 233427 cool not my custom!
    
    var body: some View {
        Button("Present music picker"){
            show.toggle() // = MusicItemID(stringLiteral: "A") // 231842 cool
        }.musicPicker(isPresented: $show, selection: $sel) // 231649
        // 233344 saw it
    }
}


/*
struct PhotosMeta: View {
    @State var isp = false // 224348
    
    var body: some View {
        PhotosPicker(<#T##LocalizedStringKey#>, selection: <#T##Binding<PhotosPickerItem?>#>)
            .photosPickerMetadataOptions(.removeCaptions) // 225632 cool
    }
}
*/

struct PhotosMetax: View {
    @State private var selection: PhotosPickerItem?
    @State private var picked: Image?

    var body: some View {
        VStack(spacing: 16) {
            PhotosPicker("Pick a photo", selection: $selection, matching: .images)
                .photosPickerMetadataOptions(.removeCaptions)   // strip captions on import
                .photosPickerSearchText("WWDC26") //234649, prefiill 242741 cool!!!
            
            picked?
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 300)
                .clipShape(.rect(cornerRadius: 12))
        }
        .padding()
        .onChange(of: selection) { _, item in
            guard let item else { return }
            Task {
                if let data = try? await item.loadTransferable(type: Data.self),
                   let ui = UIImage(data: data) {
                    picked = Image(uiImage: ui)
                }
            }
        }
    }
}



