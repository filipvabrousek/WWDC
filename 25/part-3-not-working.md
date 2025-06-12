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


