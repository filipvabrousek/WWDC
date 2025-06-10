## .glassEffect

```swift
   Button("Hello"){}
            .buttonStyle(.glass)
        
        Text("Hello")
            .font(.title)
            .padding()
            .glassEffect()
```


## .tabBarMinimizeBehavior
## .tabViewBottomAccessory

```swift

struct TabMax: View {
    var body: some View { // 144933
        TabView {
            Tab("Number", systemImage: "sun.min.fill"){
                ScrollView {
                    Text("A")
                        
                    ForEach(0..<100){ a in
                        Text("\(a)").frame(width: 400).padding()
                        
                    }
                }
            }
            
            Tab("Number", systemImage: "sun.min.fill"){
                ScrollView {
                    ForEach(0..<100){ a in
                        Text("\(a)").frame(width: 400).padding()
                        
                    }
                }
                
            }
            
            Tab("Number", systemImage: "sun.min.fill"){
                ScrollView {
                    ForEach(0..<100){ a in
                        Text("\(a)").frame(width: 400).padding()
                        
                    }
                }
                
            }
        }.tabBarMinimizeBehavior(.onScrollDown) // 144753
            .tabViewBottomAccessory {
                Button("H") {
                    print("150245a") // 150333 the accesory view swapping is so cool
                }
            }
    }
// 145223 wow instantly minimizes by itself is speed is too fast
    
}

```



## Toolbar

```swift



struct Maxo: View {
    var body: some View {
        
        NavigationStack {
            
            
            Text("Hello")
                .toolbar(id: "toolbar"){ // 205535 very nice expandable
                    ToolbarItem(id: "tag"){
                        Button("Tag"){
                            
                        }
                    }
                    
                    ToolbarSpacer(.flexible) // 205603
                    
                    ToolbarItem(id: "next"){
                        Button("Nice"){
                            
                        }
                    }
                    
                    ToolbarItem(id: "nexta"){
                        Button("Nicea"){
                            
                        }
                    } //211133 211214 to much aninm?
                    
                    
                    
                }.toolbarVisibility(.visible, for: .automatic)
        }
    }
}

```

## .backgroundExtensionEffect
##  ToolbarSpacer
```swift

struct BackgroundExtend: View {
    var body: some View {
        NavigationSplitView {
            List {
                
                
                Text("Lake")
            }
            
        } detail: {
            
            
                // 221153 weird icon¨
            
            // good for 221323 for glasswing proj
            // 221548 heavy jump effect when scrol
            
                
            // 222221 Jumping navbar in maps feel like too much
            
            
            // 222539 what??? refraction when I scroll the top of screen in iOS
            
            // 222826 and 31 Wow iPad settings
                 Image("tahoe") // 214139 Nice!!!
                .rotationEffect(.degrees(180))
                     .backgroundExtensionEffect() // 214002
                     
                     .overlay {
                         VStack {
                             Text("Hello")
                             Text("Info")
                             Text("Author")
                         }.background(.orange)
                         
                     }.toolbar {
                         
                         
                         ToolbarItemGroup {
                            
                             Button {
                                 print("A")
                             }label: {
                                 Image(systemName: "sun.min.fill")
                             }
                             
                             Button {
                                 print("B")
                             }label: {
                                 Image(systemName: "cloud.fill")
                             }
                         }
                         
                         
                         ToolbarItem(id: "A", placement: .topBarLeading) {
                             Button {
                                 print("A")
                             }label: {
                                 Image(systemName: "sun.min.fill")
                             }
                         } // 221025 anim is too much
                         
                         ToolbarSpacer(.flexible)
                         
                             ToolbarItem(id: "A") {
                                 
                                 Button {
                                     print("A")
                                 }label: {
                                     Image(systemName: "cloud.fill")
                                 }
                             }
                             
                             ToolbarItem(id: "A") {
                             Button {
                                 print("A")
                             }label: {
                                 Image(systemName: "sun.min.fill")
                             }
                         }
                     }
        }
       
    }
}
```


## AssistiveAccess

```swift
 AssistiveAccess { // 225736 225813 correct place
            Text("Hello")
        }
```
## scrollEdgeEffectStyle

```swift

struct EdgeView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<60){ item in
                    //Text("Hello")
                    
                    Circle().frame(width: 1700, height: 300)
                }
            }
        }.edgesIgnoringSafeArea(.all)
        .scrollEdgeEffectStyle(.hard, for: .all) // 235151
        // I think I need background for it
    }
}
```


## Foundation models

```swift
import FoundationModels
import Playgrounds

#Playground {
    let session = LanguageModelSession(instructions: "You are a ship expert")
    let response = try await session.respond(to: "What is the length of Icon of the Seas" /*"Integrate 2x^(e^2) from infinity to 2"*/)
    print("L")
    print(response.content)
    print("A")
    print(response) // nothing
    // This type is an implementation detail of the Playgrounds library. Do not use it directly.
}

```
