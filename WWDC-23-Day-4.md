## WWDC Day 4 (09/06)

### .coordinateSpace

```swift
struct OPJGenericView: View {
    @State var show = false
    var body: some View {
        VStack {
            GeometryReader { proxy in
                Button("Show"){
                    show.toggle()
                }
            }
        }.coordinateSpace(.named("Wow")) // 153838
        // Uses CoordinateSpaceProtocol
        
    }
}
```



### withTransaction

```swift
struct TEGenericView: View {
    @Environment(\.dismissWindow) var dismiss
    
    var body: some View {
        Button("Show"){
            withTransaction(\.dismissBehavior, .destructive){ // 155130
                dismiss(id: "auxiliary")
            }
        }
    }
}
```


### dialogSuppressionToggle
```swift
struct OPGenericView: View {
    @State var isShowing = false
    
    
    @AppStorage("supress") var alert = false // 155727
    
    
    var body: some View {
        Button("Show"){
            isShowing.toggle()
        }.confirmationDialog("Hello", isPresented: $isShowing) {
            Button("HIH"){}
        }.dialogSuppressionToggle(isSuppressed: $isShowing) // 155812
    }
}
// 155243 saw NavSplitVColumn

```


### fileExporterFilenameLabel
### fileDialogImportsUnresolvedAliases
### fileDialogBrowserOptions
### fileDialogCustomizationID

````swift

struct OJGenericView: View {
    @State var show = false
    var body: some View {
        Text("ABC").fileExporterFilenameLabel(Text("JJJ"))
            .fileDialogMessage(Text("OJOJ"))
            .fileDialogImportsUnresolvedAliases(true) // 160226
            .fileDialogBrowserOptions(.displayFileExtensions) // 160329
            .fileDialogCustomizationID("IHI") // 160338
           // .fileDialogImportsUnresolvedAliases(true) // 160304
        //.fileExporterFilenameLabel(T##label: Text?##Text?)
    }
}
```



### Inpsector

```swift
struct PONIJGenericView: View {
    @State var show = false
    var body: some View {
        Button("Show"){
            show.toggle()
        }.inspector(isPresented: .constant(true)) {
            Text("Hello")
        }.inspectorColumnWidth(23) // 160413
        
        // 160706 show programtically
           /* .searchable(text: .constant("Wow"), tokens: nil, isPresented: .constant(true)) { Identifiable in
                
            }*/
    }
}

```


### invalidateContent
* Use this modifier to annotate views that display values that are derived from the current state of your data and might be invalidated in response of, for example, user interaction.
    
    
```swift
struct OPJOGenericView: View {
    @State var show = false
    var body: some View {
        Button("Show"){
            show.toggle()
        }.invalidatableContent()
            .symbolEffectsRemoved() // 161247
    }
}
```




### to-do: Shader
### to-do: onKeyPress

