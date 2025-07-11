### GlassEffect, regular, tint

```swift

struct Flight: View {
    var body: some View {
        ZStack {
            Image("tahoe")
            
            Image(systemName: "sun.min.fill")
                .font(.title)
                .foregroundStyle(.green.gradient)
                .frame(width: 121, height: 121)
                .glassEffect(.regular.tint(.green.opacity(0.3)).interactive(), in: .circle) // 170220 inter .regular.interactive()
        }
    }
}
```

### GlassEffectContainer
### .glassEffectTransition(.identity)
### .glassEffectUnion

```swift

struct Flighta: View {
    
    @State var isExpanded = false
    @Namespace private var animation
    
    var body: some View {
        GlassEffectContainer(spacing: 20) { // 17:12:02 Airplane
            
            VStack(spacing: 20) { // 171929 wow
                
                Spacer()
                
                if isExpanded {
                    Group {
                        Button {
                            withAnimation(.smooth(duration: 1, extraBounce: 0)) {
                                isExpanded.toggle()
                            }
                        } label: {
                            Image(systemName: "heart.fill")
                                .font(.title)
                                .foregroundStyle(.green.gradient)
                                .frame(width: 50, height: 50)
                        }.buttonStyle(.glass)
                        
                        Button {
                            withAnimation(.smooth(duration: 1, extraBounce: 0)) {
                                isExpanded.toggle()
                            }
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundStyle(.green.gradient)
                                .frame(width: 50, height: 50)
                        }.buttonStyle(.glass)
                        
                    }.glassEffect(.regular, in: .circle) // capsule with namespace , circle with others
                       // .glassEffectTransition(.identity) // 172452 remove animation
                       // .glassEffectUnion(id: "group1", namespace: animation) // 172612
                    // 172544
                }
                
                
                Button {
                    withAnimation(.smooth(duration: 1, extraBounce: 0)) {
                        isExpanded.toggle()
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .foregroundStyle(.green.gradient)
                        .frame(width: 50, height: 50)
                }.buttonStyle(.glass)
                
                
                
            }
            
            
            
            
            
        }
    }
}

```

### BackExtend

```swift

struct BackExtend: View {
    var body: some View {
        
        GeometryReader {
            let size = $0.size
            
            Image("tahoe")
                .resizable()
                .frame(width: size.width, height: size.height)
                .clipped()
                .backgroundExtensionEffect()
            
        }
       
    }
}
```


### TextEditor
### writingDirection
### textInputFormattingControlVisibility
```swift

struct RichEditora: View {
    @State var rich = AttributedString()
    @State var sel = AttributedTextSelection() // 110709
    // 181117 saw
    var body: some View {
        TextEditor(text: $rich, selection: $sel)
            .writingDirection(strategy: .contentBased) // 113459 content based or layout based
            .textInputFormattingControlVisibility(.visible, for: .all) // 113630
            .frame(height: 900)
    }
}
    
```







### TabBar role .search

```swift

struct Taba: View {
    @State var page = WebPage()
    
    // 181117 saw
    var body: some View {
        TabView {
            Tab("Number", systemImage: "sun.min.fill"){
                Text("A")
            }
            
            Tab("Number", systemImage: "sun.min.fill"){
                Text("A")
            }
            
            Tab("Number", systemImage: "sun.min.fill", role: .search){ // 181618
                Text("A")
            }
        }
    }
}
```







### ```drawOn``` symbolEffect

```swift


struct Symbs: View {
    @State var expand = false // animingored can also be used
    
    var body: some View {
       Image(systemName: "square.and.arrow.up")
            .font(.largeTitle)
            .foregroundStyle(.orange)
            .symbolEffect(.drawOn, isActive: expand) // 193140 drawOn 193344 nice symbol drawing 11/06/25
            .onTapGesture {
                expand.toggle()
            }
    }
}



```



### dragging runs only on macOS

```swift

struct ColorItem:Identifiable {
    let id: String = UUID().uuidString
    var color: Color
}

let colorItems: [ColorItem] = [
    ColorItem(color: .green),
    ColorItem(color: .orange),
    ColorItem(color: .yellow)
]

struct TransitionAnim: View {
    @State private var selectedIDS: [String] = []
    @State var colorItems = [ColorItem]()
    
    var body: some View {
        VStack(spacing: 20){
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 15){
                ForEach(colorItems){ item in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(item.color.gradient)
                        .frame(width: 80, height: 80)
                        .overlay {
                            if selectedIDS.contains(item.id){
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                            }
                        }
                        .onTapGesture { // 3x
                            if selectedIDS.contains(item.id){
                                    selectedIDS.removeAll { $0 == item.id}
                                } else {
                                    selectedIDS.append(item.id)
                                }
                        }//.draggable(containerItemID: item.id)
                        } // have to compile on macOS
                }
           /* .dragContainer(for: String.self, selection: selectedIDS) { draggableItemID in
                return draggedItemID
            } // 220934 cannot run*/
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .overlay {
                    Text("Drop Area") // 221037
                }.dropDestination (for: String.self, isEnabled: true) { items, session in // 221321 drop
                    print(items)
                }.onDropSessionUpdated { session in // 221302
                    print(session)
                }
                    
                }
                
                
                
        }
        }
    


```



## .listRowInsets()

```swift

struct LRInsets: View {
    @State var text = ""
    
    var body: some View {
        List {
            // 223118 on item 12/06
            Text("Scotland").listRowInsets(EdgeInsets.init(top: 0, leading: 130, bottom: 0, trailing: 30)) // 222731 2827
            Text("Hello")
            Text("Nice")
        }
        
    }
}
```

## trans

```swift

struct TransView: View {
    @State var showSheet = false
    @Namespace private var namespace
    
    var body: some View {
        NavigationStack {
            
            
            Text("Hello")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) { // bottomBar looks worse
                        Button {
                            showSheet.toggle()
                        } label: {
                            Image(systemName: "sun.min.fill")
                        }
                    }.matchedTransitionSource(id: "transition-id", in: namespace)
                }
                .sheet(isPresented: $showSheet) {
                    Text("Hello") // 113107 weird
                        .navigationTransition(.zoom(sourceID: "transition-ID", in: namespace))
                        .frame(width: 300, height: 300)
                        .background(Color.orange)
                    // .frame(width: 200, height: 200)
                    
                    // 113529 vyuz AI nesm divit
                }
            
        }
    }
} //13/06/25
```



### Menu


```swift
// 113612 this is beautiful

struct ExpandView: View {
    @State var expand = false
    
    var body: some View {
        NavigationStack {
            
           Text("Helloa").toolbar {
                ToolbarItemGroup {
                    Button {
                        expand.toggle()
                    } label: {
                        Text("Hello")
                    }
                    
                    Menu("Collections", systemImage: "book.closed"){
                        Text("This si amazing").font(.title)
                            .bold()
                        
                        Button("Hello"){ // 115007
                            
                        }
                        
                        Button("Hello"){ // 115007
                            
                        }
                        
                        Button("Hello"){ // 115007
                            
                        }
                    }
                }
            }
            
            
        }
    }
}

```

## sharedBackgroundVisibility

```swift

struct SharedView: View {
    @State var showSheet = false
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                ZStack {
                    Text("Hello")
                        .toolbar{
                            ToolbarItem(placement: .topBarTrailing) { // bottomBar looks worse
                                Button {
                                    showSheet.toggle()
                                } label: {
                                    Image(systemName: "sun.min.fill")
                                }
                            }
                            
                            ToolbarItem(placement: .topBarTrailing) {
                                Button {
                                    showSheet.toggle()
                                } label: {
                                    Image(systemName: "sun.min.fill")
                                }
                            }.sharedBackgroundVisibility(.hidden) // 155513 160756 removes from group with background
                            // hide visibility of shared background
                        }
                    
                    Image("tahoe")
                }
                
            }
        }
    }
}
```


## SafeBar
```swift

struct SafeBar: View { //223140
    @State var text = ""
    
    var body: some View {
        VStack {
            
            List {
                ForEach(0..<100){ item in
                    Text("Hello \(item)")
                }
            }.safeAreaBar(edge: .bottom) { // overlazs content
                Text("Safe ") // 223936 15/06/25
            }
            
            // Creates gap 12348
           // Text("Safe ") // 223936 15/06/25
        }
    }
}

```




### LLM
* now working on iPad running iPadOS 26
```swift

struct AIView: View { // at Wi-Fi
    
    @State var answer = ""
    var body: some View {
        VStack {
            Button("Hello"){
                
            Task {
                let session = LanguageModelSession(/*instructions: "You are a ship expert"*/)
                let response = session.streamResponse(to: /*"What is the length of Icon of the Seas"*/ "What is SwiftUI?")//.respond(to: "What is the length of Icon of the Seas" /*"Integrate 2x^(e^2) from infinity to 2"*/)
               
                
                for try await chunk in response {
                    self.answer = chunk
                    print("Chunk")
                    print(self.answer)
                }
              //  print(response.content)
               
              }
                // Passing along InferenceError::inferenceFailed::Error Domain=com.apple.UnifiedAssetFramework Code=5000 "There are no underlying assets (neither atomic instance nor asset roots) for consistency token for asset set com.apple.modelcatalog" UserInfo={NSLocalizedFailureReason=There are no underlying assets (neither atomic instance nor asset roots) for consistency token for asset set com.apple.modelcatalog} in response to ExecuteRequest
                
                //
                
            }
        }
    }
}

```

### @Animatable macro
```swift
@Animatable // Sctoland !!!
struct CircleShape: Shape{
    var radius: CGFloat // 192752 has to have radius
    
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: .init(x: 100, y: 100), radius: /*20*/ radius, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: true)
            
        }
    }
}


struct mv: View {
    @State var expand = false // animingored can also be used
    
    var body: some View {
        CircleShape(radius: expand ? 100 : 8)
            .contentShape(.rect)
            .onTapGesture {
                withAnimation(.smooth) {
                    expand.toggle()
                }
            }
    }
}
```



### sectionIndexLabel

```swift
import SwiftUI

struct SeeLabels: View {
  var body: some View {
    List {
      Section {
        ForEach(0..<100) { _ in
          Text("Hello")
        }
      }.sectionIndexLabel(Text("First part"))  // 223640

      Section {
        ForEach(0..<100) { _ in
          Text("Mool")
        }
      }.sectionIndexLabel(Text("Second part"))  // 223640 16/06

    }.listSectionIndexVisibility(.visible)  // 223714

  }
}

// invisible?? 00439??? 16/06
// 22611 more items are needed 19/06
// 222556 have to be two section 19/06
```


### DefaultToolbarItem
* needs ```.searchable```

```swift

// 130727 DefaultToolbarItem does not work
struct Mefita: View {
    @State var search = ""
    
    var body: some View {
        NavigationStack {
            //Text("Loop")
            List {
                ForEach(0..<100){_ in
                    Text("Hello")
                }
            }
            .searchable(text: $search)
            .toolbar {
                ToolbarItem(placement: .bottomBar){
                    Button("Finally"){}
                }
                
                ToolbarSpacer(.flexible, placement: .bottomBar)
                
                DefaultToolbarItem(kind: .search, placement: .bottomBar)
            }
        }
    }
}
```
