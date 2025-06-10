# glassEffect

```swift
   Button("Hello"){}
            .buttonStyle(.glass)
        
        Text("Hello")
            .font(.title)
            .padding()
            .glassEffect()
```


## tabMax

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
    } // 145223 wow instantly minimizes by itself is speed is too fast
    
}

```
