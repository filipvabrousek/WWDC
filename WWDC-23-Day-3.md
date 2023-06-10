## Day 3 (08/06)

## Normal chart sample crashes

### Pie chart

```swift
struct MyDonut: View {
    @State var adoption = Adoption.buildCount()
    var body: some View {
        Chart(adoption, id:\.version){ element in
            SectorMark(angle: .value("Sales", element.percent), // 124537 42 fails silently if there is not a number
                       innerRadius: 0.6,
                       angularInset: 1.5) // 123842
                .foregroundStyle(by: .value("name", element.version)) // 124000
        }
    }
}

struct Adoption {
    var version: String
    var percent: Double
    
    static func buildCount() -> [Adoption]{ // 123706
       return [
        Adoption(version: "17", percent: 0.7),
        Adoption(version: "16", percent: 0.26),
        Adoption(version: "Older", percent: 0.04)
       ]
    }
}
```


### SubscriptionStore

```swift

import StoreKit

struct StoreViews: View {
    @State var show = false
    var body: some View {
        SubscriptionStoreView(groupID: "A"){ // 131357 Loading sub => Unavailable
            Text("Hello")
                .containerBackground(for: .subscriptionStoreFullHeight){
                    Rectangle()
                }
        // 12557
        } // 125514
        .subscriptionStoreButtonLabel(.multiline) // 163720
        .subscriptionStorePickerItemBackground(.thinMaterial) // 163752
        .storeButton(.visible, for: .redeemCode) // 08/06 163811
        //163823
        
    }
}

```


### fileExporter

```swift
import Foundation
import UniformTypeIdentifiers

struct FExport: View { //
    @State private var show = true
    @State private var selectedItem = "Text"
    
    var body: some View { // Not working for some reason
        Button("Show"){
            show.toggle()
        }.fileExporter(isPresented: $show, // 133654
                       item: selectedItem,
                       contentTypes: [.plainText],
                       defaultFilename: "data.txt") { res in
            print("Exported")
        }.fileExporterFilenameLabel("Export data") // 133906 08/06
            .fileDialogConfirmationLabel("133921")
    }
}
```


### dialogSeverity only macOS

```swift
// dialogIcon 195458 saw
// 195545 DialogSupressToggle.
// 5747 dialSupression

struct ABGenericView: View {
    @State var show = false
    var body: some View {
        Button("Show"){
            show.toggle()
        }.confirmationDialog("Hello", isPresented: $show) {
            Button("Erase"){
                
            }
            
            Button("Cancel"){}
        }//.dialogIcon(Image("sun.min.fill"))
           // .dialogSeverity(.critical) // 20524
    }
}
```


### toolbarTitleDisplayMode

```swift
struct fefGenericView: View {
    @State var show = false
    var body: some View {
        NavigationStack {
            Text("Hello")
                .toolbarTitleDisplayMode(.inlineLarge) // 200614
        }
    }
}

// Traits:
// https://developer.apple.com/documentation/SwiftUI/UITraitBridgedEnvironmentKey
// Obervable better perf
// 201256
// withAnimation supports completion
```

###   Obervable better perf
### withAnimation supports completion


### CustomAnimation
```swift
struct MyLinearAnimation: CustomAnimation { // 202559
    var duration: TimeInterval
    
    func animate<V: VectorArithmetic>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? {
        // 202959
        // 202705 VA
        return value.scaled(by: time / duration)
    }
    
    
    /*
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        202618
    }*/
}
```




### scrollIndicatorsFlash
### scrollClipDisabled

```swift

struct SAFlashGenericView: View {
    @State var show = false
    var body: some View {
        ScrollView {
            
            ForEach(0..<20){_ in
                Text("J")
            }
           
        }.frame(width: 100)
        .scrollIndicatorsFlash(onAppear: true) // scrol indicator flashes and disappears when view appears
        .scrollClipDisabled() // 233328
    }
} // 232251 siflash
```



### .sensoryFeedback
```swift
struct jhjohiGenericView: View {
    @State var show = false
    var body: some View {
        Button("Show yes \(show.description)"){
            show.toggle()
        }.sensoryFeedback(.selection, trigger: show) // 233824
        // 234105 Provides sensory feedback when show variable changes
    }
}
```


### focusable, focusEffectDisabled
* macOS and iOS it is conventional for button-like views to only accept focus when the user has enabled keyboard navigation system-wide in the

```swift
struct FocusGenericView: View {
    @State var show = false
    var body: some View {
        Button("Show"){
            show.toggle()
        }.focusable(show, interactions: .activate) // 234245
            .focusEffectDisabled() // 234310
        // primary action can be activated via focus gests
    }
}

```


ToDO
## onKeypress
