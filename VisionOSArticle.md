# Prepare for VisionOS article


Tag it
Copy paste code
Tweet it

Tweet:
Apple has just announced VisionOS SDK. Developers can use Xcode and SwiftUI to develop app for Apple's Vision Pro spatial computer.

### Creating a new project
Xcode gives you two options to create a project:
We will select visionOS.

In our example we will choose initial scene: Window and immersive space: none.
We then click "Create".


### Understanding the code

We will opent the app.swift file.
We can see WindowGroup View, that includes the initial view of our app.


3 types:
windows - classical windows that can have elements with slight elevation
volume - 3D experience
full space - space around you

We will use ```.windowStyle(.volumetric)``` to make a volume.


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



### ContentView

We will use  ```RealityView``` to load our scene
In the first closure of ```RealityView``` we load our content using et class and add it to our content. 

We use the update colusure.
This closure is not a render loop, it is called only on state change.
We get our content from ```content.entities.first``` and set transform to it.
We add tap gesture to our scene to make the scene larger.
Finally we use the ```glassBackgroundEffect``` modifier to add beautiful glass background to our scene.

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



### Immersive spaces

Immersive space is space that can completely sourround the user.



We will add immersive space right below the WindowGroup structure and use the id: "MySpace"

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


We can add button to content View to open our ImSpace.

User can open the immersive space by tapping this button and he will be completely sourrounded by the content of your app.

```swift
struct ContentView: View {

    @Environment(\.openImmersiveSpace) var openImmersiveSpace

    var body: some View {
    // ...
        Button("Open") {
            Task {
                await openImmersiveSpace(id: "ImmersiveSpace")
            }
        }
    }
}
```



### Interact with geometry

To-Do...



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
