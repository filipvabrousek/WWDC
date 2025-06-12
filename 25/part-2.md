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
```swift

struct RichEditora: View {
    @State var rich = AttributedString()
    @State var sel = AttributedTextSelection() // 110709
    // 181117 saw
    var body: some View {
        TextEditor(text: $rich, selection: $sel)
            .frame(height: 900)
    }
}

    
```





### AIView not working

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

// 17589š ozn site
// 175835
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




### Animation does not animate 

```swift

@Animatable // Sctoland !!!
struct CircleShape: Shape{
    var radius: CGFloat // 192752 has to have radius
    
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: .init(x: 0, y: 0), radius: 20, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: true)
            
        }
    }
    
}



struct mv: View {
    @State var expand = false // animingored can also be used
    
    var body: some View {
        CircleShape(radius: expand ? 100 : 0)
            .contentShape(.rect)
            .onTapGesture {
                withAnimation(.smooth) {
                    expand.toggle()
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



