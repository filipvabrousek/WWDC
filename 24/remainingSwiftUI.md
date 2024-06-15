## SwiftUI

* macOS
```swift
 Window(Text("A"), id: "A") {
     
 }.windowManagerRole(.principal)
```

*visionOS

```swift
   ImmersiveSpace(id: "imm") {
            MyView()
        }.persistentSystemOverlays(.hidden)
```

```swift
WindowGroup {
           MyView()
        }.windowToolbarLabelStyle(fixed: .iconOnly)
```
