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

```swift
 Button("Context"){                  
}.accessibilityLabel(Text("A"), isEnabled: true)
```

```swift
 @Environment(\.accessibilityAssistiveAccessEnabled) var enabled
```

```swift
  Button("Context"){                  
  } .accessibilityHint(Text("Hey Siri, give us a hint!"))
```

```swift
struct SizeView: View {
    var body: some View {
        Rectangle()
            .size(width: 100, height: 1000)
            .foregroundStyle(.green)
        
        // Does not affect Circle
    }
}
```

```swift
 .accessibilityRespondsToUserInteraction(true)
```

## Not working
* not working on iPadOS or visionOS
```swift
Button("Hello"){
            
        }.defaultHoverEffect(.lift)
```


```swift
 Button("Show"){
            show.toggle()
        }.hoverEffectDisabled()
```

```swift


struct DefaultScroll: View {
    @State var show = false
    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            ForEach(0..<30, id: \.self){_ in
                Text("Hello")
                    .frame(width: 800, height: 200)
                    .border(.green, width: 3)
            }
            
        }.defaultScrollAnchor(.bottomLeading, for: .initialOffset) // Scrolled to the bottom
    }
}
```


```swift
 Button("Show"){
        }.accessibilityHidden(true)
```

```swift

struct UOGenericView: View {
    @State var show = false
    var body: some View {
        Button("Show"){
            show.toggle()
        }.popover(isPresented: $show, attachmentAnchor: .rect(.bounds)) {
            Text("Wow")
        }
    }
}
```

```swift
        Button("Show"){
            show.toggle()
        }.accessibilityInputLabels([
            Text("Hello").bold()
        ])
```


* visionOS, should also work on iOS
```swift

 Button("Ing."){
            print("FAI")
        }
        .hoverEffect(ScaleAndFade())

struct ScaleAndFade: CustomHoverEffect {
    func body(content: Content) -> some CustomHoverEffect {
        content
            .hoverEffect { effect, isActive, _ in
                effect.scaleEffect(isActive ? 1.03 : 0.97)
                    .rotationEffect(isActive ? .degrees(45) : .degrees(0))
            }
            .hoverEffect { effect, isActive, _ in
                effect.opacity(isActive ? 1 : 0.9)
            }
    }
}
```

```swift
struct MenuView: View {
    @State var show = "Hello"
    
    var body: some View {
        Menu("A") {
            Picker("Flavor", selection: $show){
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }.labelsVisibility(.visible) // iOS and visionOS hide the "Flavor label" by default
           
        }
    }
}
```


```swift
Button("A"){}.accessibilityActivationPoint(.center)
```

```swift
 Text("A").accessibilityDragPoint(.bottom, description: Text("Drag here"))
 Text("C").accessibilityDropPoint(.bottom, description: Text("Drop here"))
```


# How. to. do. this.

```swift

struct SmartTextEditor: View {
    @State var text: String = "Hello"
    @State var selection: TextSelection? = nil

    var body: some View {
        VStack {
            TextEditor(text: $text, selection: $selection)
                .frame(height: 400)
                .border(.green)
            // .constant(.init(insertionPoint: String.Index.init(utf16Offset: 3, in: text)))
            
            BoundView(text: $selection)
            
            if let selection = selection {
                Text("selected")
            }
        }
        .textSelectionAffinity(.upstream)
    }

    private func getSubstrings(
        text: String, selection: TextSelection
    ) -> [Substring] {
        print(selection)
        return []
    }
}

struct BoundView: View {
    @Binding var text: TextSelection?
    var body: some View {
        if let text = text {
            Text("AAA")
        } else {
            Text("No text")
        }
    }
}

```
