## visionOS

## .depthAlignment()
### .manipulable()
### .rotation3DLayout()

```swift
  VStack {
             // 191803 ne na vejernosti :D 191842
            
            VStackLayout().depthAlignment(.front){ // 191054 Pizz 12/06
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)
                    .rotation3DLayout(Rotation3D(angle: .degrees(20), axis: .xyz)) // 131047 131336
                // 131518 Nice!!!
                // Before River Almond in Scotland
                    .manipulable() // 132133 Scotland Stanlex Mill 132217 can manipulate
                
                
                // Before the hemritage elbow 133040 12/06/25
        
           
                Text("Hello").bold()
            }.preferredWindowClippingMargins(.all, 40) // 191540 Pizz 12/06
```


### scrollInputBehaviour(.look)  or hand

```swift
 ScrollView {
                Text("Scroll enabled")
            }.scrollInputBehavior(.enabled, for: .look) // 14:01:12 eye scrolling in a car
```
