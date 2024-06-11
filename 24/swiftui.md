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









## Notes
* New Control Widget add (not working)
* List, Text, Image still backed by the same


## Not working



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
    @State var ships = [Ship(name: "Icon"),
                        Ship(name: "Seascape"),
                        Ship(name: "Oasis") ]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0...24, id: \.self) { val in
                    Text("Item \(val)")
                        .bold()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(isBeyondZero ? .orange : .green)
                }
            }.scrollTargetLayout()
            
        }.onScrollTargetVisibilityChange(for: Ship.ID.self, threshold: 0.3) { cards in
            print("Hello")
        }
    }
}
```


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
`¨¨
