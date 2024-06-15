## Previews

```swift
struct First: View {
    @State var show = false
    var body: some View {
        Button("Show"){
            show.toggle()
        }.alert(isPresented: $show) {
            Alert(title: Text("Hello"))
        }
    }
}


#Preview {
    @Previewable @State var show = true
    First(show: show)
}


@Observable
class Sample {
     var name: String = "Filip"
}


struct PM: PreviewModifier {
    static func makeSharedContext() async throws -> Context {
        let state = Sample()
        state.name = "Filip"
        return state
    }
    
    func body(content: Content, context: Sample) -> some View {
        content
            .environment(context)
    }
}


struct ComplexView: View {
    @Environment(Sample.self) var state
    var changeTo: String
    
    init(_ changeTo: String){
        self.changeTo = changeTo
    }
    
    var body: some View {
        VStack {
            Button("Change to \(self.changeTo)"){
                state.name = self.changeTo
            }
            
            Text(state.name)
        }
    }
}


#Preview(traits: .modifier(PM())){
    ComplexView("Petr")
    ComplexView("Karel")
    ComplexView("Eda")
}
```

