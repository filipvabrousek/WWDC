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


```swift

struct ContentView: View {
    @State var vis: NavigationSplitViewVisibility = .automatic // 135306
    
    var body: some View {
        NavigationSplitView(columnVisibility: $vis) {
            List {
                
                
                NavigationLink(destination: Text("I")) {
                    Text("O") // 135710
                }
            }
        } detail: {
            Text("OO")
        }

    }
}

// 134441: Observation framework exists
```





## Keyframes working

```swift

struct Article: View {
    var body: some View {
        Logo(color: .blue)
        Text("Tap the shape")
    }
}

struct Logo: View {
    var color: Color
    @State private var runPlan = 0

    var body: some View {
        VStack(spacing: 100) {
            KeyframeAnimator(
                initialValue: AnimationValues(), trigger: runPlan
            ) { values in
                LogoField(color: color)
                    .scaleEffect(values.scale)
                    .rotationEffect(values.rotation, anchor: .bottom)
                    .offset(y: values.verticalTranslation)
                    .frame(width: 240, height: 240)
            } keyframes: { _ in
                KeyframeTrack(\.verticalTranslation) {
                    SpringKeyframe(30, duration: 0.25, spring: .smooth)
                    CubicKeyframe(-120, duration: 0.3)
                    CubicKeyframe(-120, duration: 0.5)
                    CubicKeyframe(10, duration: 0.3)
                    SpringKeyframe(0, spring: .bouncy)
                }

                KeyframeTrack(\.scale) {
                    SpringKeyframe(0.98, duration: 0.25, spring: .smooth)
                    SpringKeyframe(1.2, duration: 0.5, spring: .smooth)
                    SpringKeyframe(1.0, spring: .bouncy)
                }

                KeyframeTrack(\.rotation) {
                    LinearKeyframe(Angle(degrees:0), duration: 0.45)
                    CubicKeyframe(Angle(degrees: 0), duration: 0.1)
                    CubicKeyframe(Angle(degrees: -15), duration: 0.1)
                    CubicKeyframe(Angle(degrees: 15), duration: 0.1)
                    CubicKeyframe(Angle(degrees: -15), duration: 0.1)
                    SpringKeyframe(Angle(degrees: 0), spring: .bouncy)
                }
            }
            .onTapGesture {
                runPlan += 1
            }
        }
    }

    struct AnimationValues {
        var scale = 1.0
        var verticalTranslation = 0.0
        var rotation = Angle(degrees: 0.0)
    }

    struct LogoField: View {
        var color: Color

        var body: some View {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 48)
                    .fill(.shadow(.drop(radius: 5)))
                    .fill(color.gradient)
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







