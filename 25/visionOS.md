## visionOS

### .depthAlignment()
### .manipulable()
### .rotation3DLayout()

```swift
  VStack {
             // 191803 ne na vejernosti :D 191842
            
            VStackLayout().depthAlignment(.front){ // 191054 Pizz 12/06
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)
                    .rotation3DLayout(Rotation3D(angle: .degrees(20), axis: .xyz)) // 131047 131336
                // 131518 Nice!!!
                // Before River Almond in Scotland
                    .manipulable() // 132133 Scotland Stanlex Mill 132217 can manipulate
                
                
                // Before the hemritage elbow 133040 12/06/25
        
           
                Text("Hello").bold()
            }.preferredWindowClippingMargins(.all, 40) // 191540 Pizz 12/06
```


### scrollInputBehaviour(.look)  or hand

```swift
 ScrollView {
                Text("Scroll enabled")
            }.scrollInputBehavior(.enabled, for: .look) // 14:01:12 eye scrolling in a car
```



### scaledToFill3D
### scaledToFit3D

```swift
 Model3D(named: "Scene", bundle: realityKitContentBundle){ model in
                    model.model?.resizable().scaledToFill3D() // 222131
                }
```


### manipulationGesture

```swift


struct ContentView: View {
    @GestureState var gs: Binding<Manipulable.GestureState> = .constant(.init(transform: .identity)) // 224235
    @State var translateX = 0.0
    @State var translateY = 0.0
    @State var translateZ = 0.0
    
    var body: some View {
        VStack {


 VStackLayout().depthAlignment(.front){ // 191054 Pizz 12/06
                Model3D(named: "Scene", bundle: realityKitContentBundle){ model in
                    model.model?.resizable().scaledToFill3D() // 222131
                }
                    .padding(.bottom, 50)
                    .offset(x: translateX, y: translateY)
                    .manipulationGesture(updating: gs) { change in
                        print("Changed") // need to remove manioulatalble
                        print(change.value?.transform) // Nice: 922:49 13/06/25
                        
                        translateX = (change.value?.transform?.translation.x) ?? 0
                        translateY = (change.value?.transform?.translation.y) ?? 0
                        translateZ = (change.value?.transform?.translation.z) ?? 0
                    } // 22839

}

}
}
} // 93423 highs on GitHub
```


## PresentationComponent

```swift
struct MyContentView: View {
    var body: some View {
        RealityView { content in
                let popentity = Entity() // 134442 12/06
                let popover = PresentationComponent(isPresented: .constant(true),
                                                    configuration: .popover(arrowEdge: .bottom),
                                                    content: Text("Wow").font(.title).bold().foregroundStyle(.green))
                
                popentity.components[PresentationComponent.self] = popover // 134950
                content.add(popentity)
                // 163638 Wow!!! 13/06/25
                // I don't have to be in Immersive View to make RealityView
        }
    }
}
```

## spatialOverlay
## spatialContainer

```swift

struct SpatView: View {
    var body: some View {
        SpatialContainer(alignment: .trailingFront) { // I think it is not aligning 13/06/25
            Model3D(named: "Scene", bundle: realityKitContentBundle)/*{ model in
                model.model?
                    .resizable()
                    .frame(width: 0.2, height: 0.2)
                    
                    //.offset(z: 0.3)
            }*/ // 02463 8 debug border3D
            
            Model3D(named: "Cylinder", bundle: realityKitContentBundle)
                .spatialOverlay { // 2111042
                    Text("Good luck Habu")
                        .font(.title)
                        .foregroundStyle(.green)
                        .bold()
                }
            /*{ model in
                model.model?
                    .resizable()
                    .frame(width: 0.1, height: 0.1)
                   // .offset(z: 0.3)
            }*/
            
            // 202211
            
        }
    }
}


struct Overlay: View {
    var body: some View {
        Text("Hello")
            .spatialOverlay { // 2111042
            Text("Good luck Habu")
                .font(.title)
                .foregroundStyle(.green)
                .bold()
        }
        
    }
}
```


### AspectRatio3D

```swift

struct Pol: View {
    var body: some View {
        Model3D(named: "Scene", bundle: realityKitContentBundle){ res in
            res.model?
                .resizable()
                .aspectRatio3D(Size3D(width: 1, height: 6, depth: 1),
                                                  contentMode: .fill) // 14/06/25 after Sctoland race*/
        }.frame(width: 200, height: 200)
         .frame(depth: 200)
         .border(Color(white: 0.75)) //223711
         // works 223811
    }
}
```

To-Do:
* RemoteImmersiveSpace
* Rotation3DLayout
* Surface snapping


