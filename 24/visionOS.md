## visionOS

```swift


import SwiftUI

@main
struct visionOS_24_VolumeApp: App {
    @State private var appModel = AppModel()
    @State var isOpen = false
    
    @Environment(\.openImmersiveSpace) var open
    @Environment(\.dismissImmersiveSpace) var close

    var body: some Scene {
        WindowGroup {
            Text("L")
            GenericView()
                .volumeBaseplateVisibility(.visible) // default
          //  MyView()
          // GenericView()
            
            Button("Open/Close"){
                isOpen.toggle()
                
                Task {
                   
                    if isOpen {
                        await close()
                    } else {
                        await open(id: "imm")
                    }
                }
            }
            
        }.windowStyle(.volumetric)
            .volumeWorldAlignment(.adaptive) // not compiling when put on view ??  don't see difference
            .defaultWorldScaling(.dynamic) // increase physical size of the volume as it moves further away also dont see difference
            
        
        ImmersiveSpace(id: "imm") {
            MyView()
        }.defaultSize(width: 3, height: 3)
        .immersiveContentBrightness(.bright)
        .immersionStyle(selection: .constant(.progressive(...0.0, initialAmount: 0.0)), in: .progressive) // not sure how these ranges work 0.54 is minimum currently even when setting to 30% in simulator 1:0 works OK
        
    }
}

struct GenericView: View {
    @State var color: Color = .green
    
    var effect: SurroundingsEffect? {
        return SurroundingsEffect.colorMultiply(.green)
    }
    
    var body: some View {
        ZStack {
            Text("Hello")
            Rectangle().frame(width: 700, height: 700).foregroundStyle(color)
            
            
        }.preferredSurroundingsEffect(effect)
        .onImmersionChange { immersion in
            print("Immersion \(immersion)")
            if immersion.amount > 0.7 {
                color = .orange
            } else {
                color = .green
            }
        }
       
    }
}

struct MyView: View {
    @State var color: Color = .green
    
    var body: some View {
        Text("Ing.")
            .font(.extraLargeTitle)
            .bold()
            .foregroundStyle(color)
            .supportedVolumeViewpoints(.all)
            .onVolumeViewpointChange { oldValue, newValue in
                print("AZIMUTH \(newValue.squareAzimuth)") // azimuth works
            }.onImmersionChange { immersion in
                if immersion.amount > 0.7 {
                    color = .orange
                }
            }
    }
}


// 21:43:42 saw backplate 13/06/24

```
