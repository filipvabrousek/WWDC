# WWDC 23

### New previews
```swift
#Preview {
    Text("Hello 001857")
}
```


### PhaseAnimator

```swift
struct BirdAnim: View {
    enum IPhase: CaseIterable {
        case idle
        case scale
    }
    
    var body: some View { // 105643
        PhaseAnimator(IPhase.allCases) { phase in // 105706
            Image(systemName: "bird.fill")
                .scaleEffect(phase == .scale ? 1.2 : 1)
                .background(in: .circle)
                .backgroundStyle(.teal.gradient)
                .scaleEffect(phase == .scale ? 1.05 : 1)
            
            
        }
    }
}
```

```swift
BirdAnim()
      .font(.system(size: 30))
      .scaleEffect(4.0)
```


### SubscriptionStoreView
```swift
import StoreKit

struct StoreView: View {
    @State var show = false
    var body: some View {
      SubscriptionStoreView(groupID: "filip") // 113324
    }
}
```




## watchOS

```swift
struct ContentView: View {
   @State var show = false
   var body: some View {
       TabView {
           
           Button("Hello"){
               
           }
           
           Button("Wow"){
               
           }
           
       }.tabViewStyle(.verticalPage) // 112544
        .containerBackground(Color.orange, for: .tabView) // 112603
   }
}
// ((PUICTouchAvoidingCollectionView *)0x10202f800): UICollectionView
// 122613
```


```swift
struct ContentView: View {
    @State var show = false
    var body: some View {
        NavigationStack {
            Button("Show"){
                show.toggle()
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) { // 133235
                    Button("New in watchOS10"){ // 133430 saw
                        
                    }
                }
            }
        }
    }
}
```


## Keyframe didn't get it to work
* crashes

```swift

import SwiftUI // 124624 SwiftUI not imported warning
import MapKit

extension CLLocationCoordinate2D { // 132043
 
    static func applePark() -> CLLocationCoordinate2D {
        return .init(latitude: 20, longitude: 30)
    }
    
    static func infiniteLoop() -> CLLocationCoordinate2D {
        return .init(latitude: 20, longitude: 30)
    }
  //  var applePark =

    
   // var infiniteLoop = .init(latitude: 40, longitude: 60)
}



struct GenericViewsss: View {
    @State var show = false
    @State var position = MapCameraPosition.region(MKCoordinateRegion.init(center: .init(latitude: 20, longitude: 30), span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    
    
    var body: some View {
        
        VStack {
            
            Button("Show"){
                show.toggle()
            }
            
            
            Map(position: $position)
                .mapCameraKeyframeAnimator(trigger: show) { _ in
                    KeyframeTrack(\.centerCoordinate) { // 131828
                        CubicKeyframe(CLLocationCoordinate2D.applePark(), duration: 1.1) // 131850
                        CubicKeyframe(CLLocationCoordinate2D.infiniteLoop(), duration: 3.1) // 131850
                    }
                }
            
        }   
    } 
}



// https://developer.apple.com/documentation/updates/swiftui
// Changes







```

## SwiftData
Just use checkbox when creating a new project


## VisionOS
* zDepth
* platform to come later

Make article!







