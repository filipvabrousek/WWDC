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

## visionOS Surface snapping

```swift

struct LightFixtureView: View {
    @Environment(\.surfaceSnappingInfo)
    var snappingInfo: SurfaceSnappingInfo


    var body: some View {
        if snappingInfo.isSnapped {
            switch SurfaceSnappingInfo.authorizationStatus {
                case .authorized:
                    switch snappingInfo.classification {
                        case .table:
                        Text("Table")
                        
                            //LampView()
                        case .floor:
                        Text("Floor")
                           // FloorLampView()
                        default:
                        Text("Default")
                          //  DefaultLampView()
                    }
                default:
                    Text("Default")
                    //DefaultLampView()
            }
        } else {
            Text("Default orb")
            //FloatingOrbLampView()
        }
    }
}



struct SnapTest: View {
    @Environment(\.surfaceSnappingInfo) var snap: SurfaceSnappingInfo // 15:11.11
    
    @GestureState var gs: Binding<Manipulable.GestureState> = .constant(.init(transform: .identity))
    
    @State var translateX:CGFloat = 0
    @State var translateY:CGFloat = 0
    @State var translateZ:CGFloat = 0
    
    var body: some View {
        VStackLayout().depthAlignment(.center) { // 151205 151213
            Model3D(named: "Scene", bundle: realityKitContentBundle)
               // .manipulable()
                .offset(x: translateX, y: translateY)
                .manipulationGesture(updating: gs) { change in
                    print("Changed") // need to remove manioulatalble
                    print(change.value?.transform) // Nice: 922:49 13/06/25
                    
                    translateX = (change.value?.transform?.translation.x) ?? 0
                    translateY = (change.value?.transform?.translation.y) ?? 0
                    translateZ = (change.value?.transform?.translation.z) ?? 0
                    
                    print("SNAP CLAS")
                    print(snap.classification) // nil
                }
            
            
            Text("Has snapped")
                .opacity(snap.classification == .ceiling ? 1.0 : 0.0) // 151619 was table, was wall before ceiling
            
        }
    }
}
```




