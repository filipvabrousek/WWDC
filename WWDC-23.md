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
````swift
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


// watchOS
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

## SwiftData
Just use checkbox when creating a new project






## VisionOS
* zDepth
* platform to come later

Make article!







