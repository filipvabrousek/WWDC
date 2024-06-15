## SwiftUI

* macOS
```swift
 Window(Text("A"), id: "A") {
     
 }.windowManagerRole(.principal)
```

* visionOS

```swift
   ImmersiveSpace(id: "imm") {
            MyView()
        }.persistentSystemOverlays(.hidden)
```

```swift
WindowGroup {
           MyView()
        }.windowToolbarLabelStyle(fixed: .iconOnly)
        .restorationBehavior(.disabled)
```


```swift
// ScrollContentOffsetAdjustmentBehavior
// defined on Transaction
```

* should be available in iOS, but not working
```swift
.sectionActions {
            Button("Hello"){}
        }
```


```swift
 Button("Show"){
            show.toggle()
        }.dropDestination(for: String.self) { ids, a in
            return true
        }
```


```swift
TabView {
Tab {}.springLoadingBehavior(.enabled)
}.springLoadingBehavior(.disabled)
```



```swift
TabView {
Tab {
}.badge(3)
}
