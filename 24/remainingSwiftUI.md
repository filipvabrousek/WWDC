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
```






## Not working
```swift
Tab {
   Text("C")
}.popover(isPresented: .constant(true)) {
                        Text("Hello").padding(.all, 20)
                    }
```



## Okay
```swift
Tab {
   Text("C")
} .swipeActions {
   Button("Swipe"){
                            
    }
}
```



```swift
Tab {
   Text("C")
} .contextMenu {
   Button("Swipe"){
                            
    }
}
```


```swift
Tab  {}.accessibilityIdentifier("Hello")
```

```swift
Tab {}.tabPlacement(.pinned) // cannto drag to toolbar
```
