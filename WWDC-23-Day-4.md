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


### multiple strokes
* Stroke returns StrokeShapeView<Content, Style, Background>
* StrokeShapeView: ShapeView
* .stroke => StrokeBordeTypeView
* .fill => FillShapeView
    
    
```swift
struct OIGenericView: View {
    @State var show = false
    var body: some View {
        Circle()
            .stroke(.green, lineWidth: 3.0) // 204726
            .stroke(.orange, lineWidth: 3.0)
        
    } 
}
```



### contentMargins

```swift
struct XXGenericView: View {
    @State var show = false
    var body: some View {
        ScrollView {
            ForEach(0..<100){_ in
                Text("Thransformers are amazing movie in 2023")
                    .background(Color.green)
            }
          
        }.background(Color.orange)
       
        // .contentMargins(90, for: .scrollContent) // 215245
         //   .contentMargins(.horizontal, 90)
         .clipShape(.rect(cornerRadius: 20)) // 221035 Nice!!!
         .contentMargins(.horizontal, 10, for: .scrollContent)
            .contentMargins(.vertical, 30, for: .scrollContent)
        //   .contentMargins(10.0, for: .scrollIndicators) JUST NO DIRECTION HORIZONTAL BY DEFAULT
    
    }
}
```



### .listSectionSpacing
### .selectionDisabled

```swift
struct ListGenGenericView: View {
    @State var show = false
    var body: some View {
        List {
            
            Section { // 224851 as BC , 47 space between section!!
                Text("Hello")
            }
            
            Section {
                Text("Oh wow!")
            }
            
        }.listSectionSpacing(.compact) // PP 223721 comapct or pi
            .selectionDisabled() // 225408
        
        // 225018 macOS List.alternatingROwBackground 09/06
        
    }
}
```





### .backgroundProminence
### .badgeProminence

```swift
struct XAGenericView: View {
    @State var show = false
    @Environment(\.backgroundProminence) var it
    
    var body: some View {
        Button("S"){
            show.toggle()
        }.foregroundColor(it == .increased ? .orange : .green)
            .badgeProminence(.increased) // 225402
           
    }
}
```


### .scrollTargetBehaviour
### .scrollClipDisabled

* if the views inside the scroll view have shadows that extend beyond the bounds of the scroll view, you can use this modifier to avoid clipping the 
* 113420

```swift

struct PageGenericView: View {
    @State var show = false
    var body: some View {
       
        ScrollView {
               LazyVStack(spacing: 0.0) {
                   ForEach(0..<20) { item in
                       ZStack { // 2030033 09/06
                          
                           Rectangle()
                               .frame(width: 100, height: 200)
                               .padding()
                           
                           Text("Item \(item)")
                               .foregroundColor(.orange)
                       
                           // 231217 .invalid frame
                          
                       }
                      
                   }
             }
            }
            .scrollTargetBehavior(.paging) // makes pages like scroll ???
            .scrollClipDisabled() // 231441

    }
}

```




### .springLoadingBehaviour

```swift
struct SpringView: View {
    @State var show = false
    var body: some View {
        Button("Show"){
            show.toggle()
        }.springLoadingBehavior(.enabled) // 231605
        // View can be activateed during drag and drop
        // overrides parent view
        
    }
}
```



### to-do: Shader
// EmptyVisEff
// Shader, disortion and layer effect to do
### to-do: onKeyPress

