### FindContext

```swift
struct FindCtx: View {
    @State var text = ""
    @Environment(\.findContext) var findContext // 111216 12/06/25
    var body: some View {
        
        VStack {
            
            
            TextEditor(text: $text)
                .frame(height: 900)
                .overlay {
                    ZStack {
                       /* if let context = findContext && context.isPresented?.wrappedValue == true {
                           
                        }*/
                        
                        if findContext != nil {
                            if /*findContext!.supportsReplace == true &&*/ findContext!.isPresented?.wrappedValue == true {
                                Text("Find view") // 112233 12/06 ipad anim zoom
                            }
                        }
                    }
                }
            
            Button("Show navigator"){
                findContext?.isPresented?.wrappedValue.toggle()
            }
        }
    }
}
```


### LLM

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


### Animatable

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

## for macOS
* https://developer.apple.com/documentation/SwiftUI/View/windowResizeAnchor(_:)




