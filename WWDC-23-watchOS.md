# WWDC23 watchOS

```swift
struct ContentView: View {
    @State var show = false
    var body: some View {
        NavigationStack {
            Button("Show"){
                show.toggle()
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) { // 133235
                    Button("New in watchOS10"){ // 133430 saw
                        
                    }
                }
            }
        }
    }
}
```



### verticalPage

```swift
// watchOS
struct ContentViews: View {
   @State var show = false
   var body: some View {
       TabView {
           Button("Hello"){
               
           }
           
           Button("Wow"){
               
           }
       }.tabViewStyle(.verticalPage) // 112544
        .containerBackground(Color.orange, for: .tabView) // 112603
   }
}
```

// ((PUICTouchAvoidingCollectionView *)0x10202f800): UICollectionView
// 122613



### ToolbarItem(placement: .topBarTrailing)

```swift
struct ContentViewo: View {
    @State var show = false
    var body: some View {
        NavigationStack {
            Button("Show"){
                show.toggle()
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) { // 133235
                    Button("New in watchOS10"){ // 133430 saw
                        
                    }
                }
            }
        }
    }
}
```



### NavigationSplitView

```swift
struct ContentView: View {
    @State var vis: NavigationSplitViewVisibility = .automatic // 135306
    
    var body: some View {
        NavigationSplitView(columnVisibility: $vis) {
            List {
                
                
                NavigationLink(destination: Text("I")) {
                    Text("O") // 135710
                }
            }
        } detail: {
            Text("OO")
        }

    }
}

// 134441: Observation framework exists
```


### NavigationSplitViewVisibility

```swift
struct ContentView: View {
    @State var vis: NavigationSplitViewVisibility = .automatic // 135306
    
    var body: some View {
        NavigationSplitView(columnVisibility: $vis) {
            List {
                
                
                NavigationLink(destination: Text("I")) {
                    Text("O") // 135710
                }
            }
        } detail: {
            Text("OO")
        }

    }
}

// 134441: Observation framework exists
```





### hourMinuteAndSecond in DatePicker
* 07/06 16:57:27 last edited file
```swift
struct DatePi: View {
    @State var date = Date()
    var body: some View {
        DatePicker("Time", selection: $date, displayedComponents: .hourMinuteAndSecond) // 143953
        // 144151
        
    }
}
```




