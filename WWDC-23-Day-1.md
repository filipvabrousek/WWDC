## WWDC23 Day 1



### Map new things
```swift

struct CleverMaps: View { // 07/06
     var loc = CLLocationCoordinate2D(
        latitude: CLLocationDegrees(floatLiteral: 37.3353),
        longitude: CLLocationDegrees(floatLiteral: -122.0097))
    
    
    var body: some View {
        Map {
            Marker("Apple Park", coordinate: loc)
            UserAnnotation() // 145118
        }.mapControls { // 145130
            MapUserLocationButton() //145151
            MapCompass() // 145143
        }
    }
}
```

### Inspector


```swift
struct InspectorTest: View {
    @State var show = false
    var body: some View {
        Button("Show isnpector"){
            show.toggle()
        }.inspector(isPresented: $show) { // 06/06 23:59
            Text("Wow")
        }
    }
}

```



### VisualEffect

```swift
struct VisualEffectView: View {
    @State var show = false
    var body: some View {
        Text("Hello").visualEffect { view, geo in
            view.offset(y: geo.size.height)
        }
    }
}
```


### SymbolEffect

````swift
struct SE: View {
    @State var show = false
    var body: some View {
       Image(systemName: "sun.min.fill")
            .symbolEffect(.pulse) // 002341
    }
}
```





### ScrollTransition

```swift
struct SView: View {
    @State var show = false
    var body: some View {
        ScrollView {
            LazyVStack { // 002619 07/06
                ForEach(0..<20){_ in
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .scrollTransition { content, phase in
                            content.scaleEffect(phase.isIdentity ? 1:0.6)
                                .opacity(phase.isIdentity ? 1 : 0) // 29:50 Nice!!!!
                        }
                    // 002728
                        
                }
            }
        }.safeAreaPadding(.horizontal, 16.0) // 2845
    }
}

// https://developer.apple.com/documentation/swiftui/transition
// https://developer.apple.com/documentation/swiftui/unitcurve 41:02
```
