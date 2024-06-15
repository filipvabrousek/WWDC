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


## Not clear

```swift

struct MyRepresentable: UIViewControllerRepresentable {
    
    @Binding var isCollapsed: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        context.animate {
            print("Animate")
        }
    }
}


MyRepresentable(isCollapsed: .constant(true))
```


## Working

```swift

struct IGenericView: View {
    @State var show = false
    var body: some View {
        ScrollView {
            ForEach(0..<30, id: \.self){_ in
                Text("Hello")
                    .frame(width: 200, height: 200)
                    .border(.green, width: 3)
            }.scrollTargetLayout()
            
        }.scrollTargetBehavior(.viewAligned) // This will stick on scrolling
    }
}
```



* ```accessibilityValue``` just to values without children
```swift
 Button("Context"){                  
  } .accessibilityValue("A")
```
