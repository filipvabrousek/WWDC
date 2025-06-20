### FindContext

```swift
struct FindCtx: View {
    @State var text = ""
    @Environment(\.findContext) var findContext // 111216 12/06/25
    var body: some View {
        
        VStack {
            
            
            TextEditor(text: $text)
                .frame(height: 900)
                .overlay {
                    ZStack {
                       /* if let context = findContext && context.isPresented?.wrappedValue == true {
                           
                        }*/
                        
                        if findContext != nil {
                            if /*findContext!.supportsReplace == true &&*/ findContext!.isPresented?.wrappedValue == true {
                                Text("Find view") // 112233 12/06 ipad anim zoom
                            }
                        }
                    }
                }
            
            Button("Show navigator"){
                findContext?.isPresented?.wrappedValue.toggle()
            }
        }
    }
}
```



## for macOS
* https://developer.apple.com/documentation/SwiftUI/View/windowResizeAnchor(_:)


## GestureComponent
```swift

RealityView { content in


let popentity = Entity()
 let drag1 = GestureComponent(SpatialTapGesture().onChanged { a in
                print("TAPPO")
            })
            
            
            popentity.components[GestureComponent.self] = drag1
          //  popentity.components.set(drag1) // 152305
            
            content.add(popentity)

}
```






## DefaultToolbarItem
```swift

struct Defita: View {
    @State var text = ""
    var body: some View {
        NavigationStack {
            Text("Loop")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Hello"){}
                    }
                    
                   // DefaultToolbarItem(kind: .title)
                   // DefaultToolbarItem(kind: .search) show emptxy toba bar ?
                    
                    DefaultToolbarItem(kind: .title) // also show empty
                    
                    //{ // 225501 15/09
                    //Button("L")
                    // }
                }
        }
    }


}
```

```swift

// 130727 DefaultToolbarItem does not work
struct Mefita: View {
    var body: some View {
        NavigationStack {
            //Text("Loop")
            List {
                ForEach(0..<100){_ in
                    Text("Hello")
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar){
                    Button("Search"){}
                }
                
                ToolbarSpacer(.flexible, placement: .bottomBar)
                
                DefaultToolbarItem(kind: .search, placement: .bottomBar)
                
                ToolbarSpacer(.fixed, placement: .bottomBar)
                
                ToolbarItem(placement: .bottomBar) {
                    Button("New message"){
                        
                    }
                }
                
                
            }
        }
    }
}
```

## DragConfiguration

```swift

struct DragView: View {
    @State var text = ""
    var body: some View {
        NavigationStack {
            Text("Loop")
            Circle().frame(width: 30, height: 30)
        }
    }
    
    func makeConf() -> DragConfiguration {
        let operations = DragConfiguration(allowMove: true)
        return operations
    }
}

```

## macOS drag

```swift



struct ColorItem:Identifiable {
    let id: String = UUID().uuidString
    var color: Color
}

let colorItems: [ColorItem] = [
    ColorItem(color: .green),
    ColorItem(color: .orange),
    ColorItem(color: .yellow)
]
/*
extension String: Identifiable {
    public var id: String { self }
}*/

struct TransitionAnim: View {
    @State private var selectedIDS: [String] = []
    @State var colorItems = [ColorItem]()
    
    var body: some View {
        VStack(spacing: 20){
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 15){
                ForEach(colorItems){ item in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(item.color.gradient)
                        .frame(width: 80, height: 80)
                        .overlay {
                            if selectedIDS.contains(item.id){
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                            }
                        }
                        .onTapGesture { // 3x
                            if selectedIDS.contains(item.id){
                                    selectedIDS.removeAll { $0 == item.id}
                                } else {
                                    selectedIDS.append(item.id)
                                }
                        }//.draggable(containerItemID: item.id) https://developer.apple.com/documentation/swiftui/view/draggable(containeritemid:)
                        } // have to compile on macOS
            }
            .dragContainer(for: String.self, selection: selectedIDS) { draggedItemID in
                return draggedItemID
            } // 220934 cannot run
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .overlay {
                    Text("Drop Area") // 221037
                }.dropDestination (for: String.self, isEnabled: true) { items, session in // 221321 drop
                    print(items)
                }.onDropSessionUpdated { session in // 221302
                    print(session)
                }
                    
                }
                
                
                
        }
        }


```





