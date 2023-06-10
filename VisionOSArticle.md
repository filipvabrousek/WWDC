# Prepare for VisionOS article


Tag it
Copy paste code
Tweet it

Tweet:
Apple has just announced VisionOS SDK



At WWDC23 Apple has announced VisionOS along with 
* Xcode creates basic app from app template s


You have two options to choose from:

In our example we can choose 


### App structure
```swift
@main
struct MyFirstImmersiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
```


```swift
#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
```


### MainView.swift
```swift

VStack {
VStack {

 Toggle("Enlarge RealityView Content", isOn: $enlarge)
            .toggleStyle(.button)

RealityView { content in
    // Add the initial RealityKit content
    if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
        content.add(scene)
    }
} update: { content in
    // Update the RealityKit content when SwiftUI state changes
    if let scene = content.entities.first {
        let uniformScale: Float = enlarge ? 1.4 : 1.0
        scene.transform.scale = [uniformScale, uniformScale, uniformScale]
    }
}
.gesture(TapGesture().targetedToEntity().onEnded { _ in
    enlarge.toggle()
})
   }
    .padding()
    .glassBackgroundEffect()
}

```



### openImmSpace
```swift
struct ContentView: View {

    @Environment(\.openImmersiveSpace) var openImmersiveSpace

    var body: some View {
        Button("Open") {
            Task {
                await openImmersiveSpace(id: "ImmersiveSpace")
            }
        }
    }
}
```







### gestures


```swift
mport SwiftUI
import RealityKit

struct ContentView: View {
    var body: some View {
        RealityView { content in
            // For entity targeting to work, entities must have a CollisionComponent
            // and an InputTargetComponent!
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded { value in
            print("Tapped entity \(value.entity)!")
        })
    }
}
```





```swift
.gesture(TapGesture().targetedToAnyEntity().onEnded { value in
    var transform = value.entity.transform
    transform.translation += SIMD3(0.1, 0, -0.1)
    value.entity.move(
        to: transform,
        relativeTo: nil,
        duration: 3,
        timingFunction: .easeInOut
    )
})
```


## Prepare for visionOS
