## watchOS

* appears broken if not used in widget context
```swift

struct watchOS_24_widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        AccessoryWidgetGroup {
            Label("Images", systemImage: "sun.min.fill")
                .foregroundStyle(.green)
        } content: {
            ForEach(0...2, id: \.self){ val in
                Button("A"){}
                    .background(.green)
                    .clipShape(.circle)
            }
        }
        
    }
}
```



## handGestureShortcut
* reacts on Double Tap
```swift
       Button("Tap me"){ // Nice highlight effect
            print("Double tapped!")
        }.handGestureShortcut(.primaryAction)
        
        
```
