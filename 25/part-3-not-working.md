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



### Animatable

```swift

@Animatable // Sctoland !!!
struct CircleShape: Shape{
    var radius: CGFloat // 192752 has to have radius
    
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: .init(x: 0, y: 0), radius: 20, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: true)
            
        }
    }
    
}



struct mv: View {
    @State var expand = false // animingored can also be used
    
    var body: some View {
        CircleShape(radius: expand ? 100 : 0)
            .contentShape(.rect)
            .onTapGesture {
                withAnimation(.smooth) {
                    expand.toggle()
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

## sectionIndexLabel
```
struct SectInd: View {
    @State var text = ""
    var body: some View {
        List {
            Section { // invisible?? 00439??? 16/06
                Text("Hello")
            }.sectionIndexLabel(Text("Loop")) // 223640
                .listSectionIndexVisibility(.visible) // 223714
        }
    }

}
```




