## Small things


### Maps
```swift

import SwiftUI
import MapKit

struct MapsView: View {
    @State var show = false
    @State var destination: MKMapItem = .init(placemark: .init(coordinate: .init(latitude: 20, longitude: 30)))
    @State var route = MKRoute() //235137
    
    var body: some View {
        Map {
            Marker(item: destination) // 234941
            MapCircle(center: .init(latitude: 23, longitude: 40), radius: 30) // 07.06 0:11
        }.onAppear {
           
        }
    }
}

```


## Inspector

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



## VisualEffect

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



## SymbolEffect

```swift
struct SE: View {
    @State var show = false
    var body: some View {
       Image(systemName: "sun.min.fill")
            .symbolEffect(.pulse) // 002341
    }
}
```




## ScrollTransition

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

```




## Next day



```Swift


```


### visionOS guidelines are on the paper
