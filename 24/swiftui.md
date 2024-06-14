# WWDC24

## MeshGradient
```swift
struct ContentView: View {
    var body: some View {
        MeshGradient(width: 3,
                     height: 3,
                     points: [
                        [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                        [0.0, 0.5], [0.9, 0.3], [1.0, 0.5],
                        [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
                     ],
                     colors: [
                              .green, .green, .green,
                              .blue, .blue, .orange,
                              .green, .orange, .blue
                     ]
        )
    }
}
```



## mix

```swift
struct ColorMixView: View {
    @State var show = false
    var body: some View {
        Color.green.mix(with: .blue, by: 0.3)
    }
}
```



## forEachSubviewOf

```swift

struct Board<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack {
            ForEach(subviewOf: content) { subview in
                Group {
                    subview
                }.border(Color.green, width: 3)
            }
        }
    }
}
```

```swift
 Board {
     Text("Three")
     Text("Two")
     Text("One")
 }
```


## onScrollVisibilityChange

```swift

struct ScrollReactingView: View {
    @State var show = false
    var body: some View {
        ScrollView {
            ForEach(0...24, id: \.self) { val in
                Text("Item \(val)")
                    .bold()
                    .padding()
            }
            
            Text("Video")
                .foregroundStyle(.green)
                .frame(width: 100, height: 300)
                .border(.green)
                .onScrollVisibilityChange(threshold: 0.3) { val in
                if val {
                    print("Twenty") // After 1/3 of the value is scrolled
                }
            }
            
            ForEach(0...24, id: \.self) { val in
                Text("Item \(val)")
                    .bold()
                    .padding()
            }
            
        }.frame(width: 300)
    }
}
```



## onScrollGeometryChange
```swift


struct ScrollNextView: View {
    @State var isBeyondZero = false
    
    var body: some View {
        ScrollView {
            ForEach(0...24, id: \.self) { val in
                Text("Item \(val)")
                    .bold()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(isBeyondZero ? .orange : .green)
            }
            
        }.onScrollGeometryChange(for: Bool.self) { geo in
            geo.contentOffset.y < geo.contentInsets.top
        } action: { wasBeyondZero, isBeyondZero in
            // Color change when item 0 goes off-screen
            self.isBeyondZero = isBeyondZero
        }
    }
}


```


## onScrollPhaseChange


```swift

struct ScrollDeclaratingView: View {
    @State var isBeyondZero = false
    @State var ships = ["Icon", "Seascape", "Oasis"]
    
    var body: some View {
        ScrollView {
            ForEach(0...24, id: \.self) { val in
                Text("Item \(val)")
                    .bold()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(isBeyondZero ? .orange : .green)
                    .frame(width: 300)
                    .border(Color.orange, width: 3)
            }
            
            
        }.onScrollPhaseChange { oldPhase, newPhase in
            // decelerating = user has stopped scrolling and scrollview decelarates
            if newPhase == .decelerating || newPhase == .idle {
                print("Update selection")
            }
        }
    }
}


```



## LinePlot

```swift
import Charts 
struct LineView: View {
    var body: some View {
        Chart {
            LinePlot(x: "x", y: "y"){ x in
                x * x
            }
            .lineStyle(StrokeStyle(lineWidth: 3,
                               lineCap: .round))
                .foregroundStyle(.green)
        }
        .chartXScale(domain: -10...10)
         .chartYScale(domain: -10...10)
        // does not work with .range
        // .border(.green)
    }
}
```





## presentationSizing

```swift

struct SimplePres: View {
    @State var show = false
    var body: some View {
        Button("Show"){
            show.toggle()
        }.sheet(isPresented: $show) {
            Text("Form sheet")
                .font(.title)
                .presentationSizing(.form.fitted(horizontal: true,
                                                 vertical: false))
            // assuress correct sizing on the iPad
            // fitted allows it to expand in vertical or hoizontal way
            // sizing
        }
    }
}
```


## matchedTransition

```swift


// Only options are .zoom and .automatic
struct HeroAnimationView: View {
    @Namespace var hero
    
    var body: some View {
        NavigationStack {
            NavigationLink {
               Image("icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .navigationTransition(.zoom(sourceID: "myID", in: hero)) // it slides from right without this
            } label: {
                Image("icon")
                     .resizable()
                     .clipShape(.circle)
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 60)
                     .matchedTransitionSource(id: "myID", in: hero) // Circle gets smaller smoothly, ID's need to match
            }
            
        }
    }
}


```


## ScrollPos

```swift
struct ScrollPos: View {
    @State private var position: ScrollPosition = .init(point: .zero)
    
    var body: some View {
        ScrollView {
            ForEach(0..<1000){ item in
                Text(item.formatted())
            }
            
            Button("Jump to top"){
                position = ScrollPosition(point: .zero)
            }
            
        }.scrollPosition($position)
    }
}
```


## Custom Cards

```swift

struct Wrapper<Content: View>: View {
    var color: Color
    var content: Content
    
    init(_ color: Color, @ViewBuilder content: () -> Content){
        self.color = color
        self.content = content()
    }
    
    var body: some View {
        content.border(color, width: 3)
    }
}



struct Cards<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    
    var body: some View {
        VStack {
            Group(subviewsOf: content){ subviews in
               
                    if subviews.count > 1 {
                        HStack {
                            Wrapper(.green) {subviews[0]}
                            Wrapper(.green) {subviews[1]}
                        }
                    } else {
                        Text("Not enough views")
                    }
                    
                    if subviews.count >= 2 {
                        subviews[2...]
                    }
                
                 
            }
        }
    }
}
```


## Custom Containers

```swift
 MyContainer {
               Text("Hello").containerValue(\.myCustomValue, "HelloValue")
               Text("Nice").containerValue(\.myCustomValue, "NiceValue")
               Text("Best").containerValue(\.myCustomValue, "BestValue")
           }
```

```swift
 struct MyContainer<Content: View>: View {
     var content: Content

     init(@ViewBuilder content: () -> Content) {
         self.content = content()
     }

     var body: some View {
         Group(subviewsOf: content) { subviews in
             ForEach(subviews) { subview in
                 // Display each view side-by-side with its custom value.
                 HStack {
                     subview
                     Text(subview.containerValues.myCustomValue)
                 }
                 
             }
         }
     }
 }
```





```swift
import RealityKit // in other file than App struct

struct MyV: View {
    var body: some View { // RealityKit.ARView: UIView
        RealityView { content in
            let mesh = MeshResource.generateCylinder(height: 0.03, radius: 0.07)
            let entity = ModelEntity(mesh: mesh, materials: [SimpleMaterial(color: .green, isMetallic: false)])
            content.add(entity)
        }

    }
}


```


## SearchFocused

```swift

struct SearchView: View {
    @State var show = ""
    @FocusState var isSearchFocused: Bool
   
    var body: some View {
        NavigationStack {
            Text("A")
            Button("Focus"){
                if !isSearchFocused{
                    isSearchFocused = true
                }
            }
        }.searchable(text: $show)
            .searchFocused($isSearchFocused)
    }
}
```


```swift

class Ship: Identifiable {
    var name: String
    var id: UUID
    
    init(name: String){
        self.name = name
        self.id = UUID()
    }
}

struct ScrollTargetView: View {
    @State var isBeyondZero = false
    @State var ships = [
        Ship(name: "Icon"),
                        Ship(name: "Seascape"),
                        Ship(name: "Oasis"),
                        Ship(name: "Luminosa"),
                        Ship(name: "Ruby Princess")
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(ships, id: \.id) { val in
                    Text(val.name)
                        .bold()
                        .frame(width: 300, height: 300)
                        .border(.green)
                        .foregroundStyle(isBeyondZero ? .orange : .green)
                }
            }.scrollTargetLayout()
            // necessary for .scrolltargetVisibility()
            
        }
        // Ship is considered on-screen if at least 1/3 of it is visible
        .onScrollTargetVisibilityChange(idType: Ship.ID.self, threshold: 0.3) { action in
            print("-----------------------------------------------------------")
            print("On screen ships")
            for el in action {
                let ela = ships.filter {$0.id == el}.first!
                print(ela.name)
            }
        }
    }
}

```





## Notes
* New Control Widget add (not working)
* List, Text, Image still backed by the same


## Missing
* visionOS: ```volumeWorldAlignment```, ```defaultWorldScaling``` not working
* tableColumnForEach



```swift
struct TextSelectionEditor: View {
    @State var text: String = ""
    @State var selection: TextSelection? = nil
    
    var body: some View {
        VStack {
            TextEditor(text: $text, selection: $selection)
            
            if selection?.indices != nil {
                Text(selection?.ranges)
               /* ForEach(selection!.indices, id: \.self){ r in
                    Text(r)
                }*/
            }
        }.textSelectionAffinity(.upstream) // 9:49:41
    }
}
```
