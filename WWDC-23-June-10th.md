## WWDC 23 - 10/06

### Metal shader

```swift
struct ShadersGenericView: View {
    let shader = Shader(function: .init(library: .default, name: "remove_color"), arguments: [.color(.orange)]) // 144342
    // Define the shader in another file, I do not know how yet...
    
    @State var show = false
    
    var body: some View {
        ZStack {
            Image("seascape")
                .resizable()
                .colorEffect(shader, isEnabled: true) // 144812
        }
    }
}

```
