## Day 2 (07/06)

### textScale
```swift
struct TextScaled: View {
    @State var show = false
    var body: some View {
        Text("Secondary").textScale(.secondary) // 102924
    }
}

```

### typesettingLanugage

```swift
struct TypedLang: View {
    var lang = Locale.Language(languageCode: .thai) // 103639
    
    var body: some View {
        Text(verbatim: "แอปเปิล")
            .typesettingLanguage(.init(languageCode: .thai)) // respect space
     //   Text("Thoi").typesettingLanguage(lang) // 103706
    }
}
```



### scrollPisition and targetLayout

```swift

struct TargetPos: View {
    @State private var scrollPosition: Int? = 0
    
    var body: some View {
        ScrollView {
            Button("Scroll") {
                scrollPosition = 20
            }
            
            ForEach(1..<100, id: \.self) { number in

                    Text(verbatim: number.formatted())
                    .frame(width: 200, height: 30)
                    .background(.orange)
                
                
            }
            .scrollTargetLayout() // 114236 settle on geometrz
           
        }//.frame(height: 300)
        .scrollPosition(id: $scrollPosition)
      //  .safeAreaInset(edge: .top)
    }
}

```

### containerRelativeFrame

```swift
struct MyScrolls: View {
    @State var items = (1..<10).map {"Name: \($0)"}
    
    var body: some View {
        Text("On top")
             .bold()
             .safeAreaInset(edge: .top){ // 122640
                 ScrollView(.horizontal){
                     LazyHStack {
                         ForEach(items, id: \.self){ item in
                             RoundedRectangle(cornerRadius: 10.0)
                                 .fill(.green.gradient)
                                 .aspectRatio(3.0/2.0, contentMode: .fill)
                                 //.aspectRatio(3.0 / 2.0, contentMode: .fill)
                                 .containerRelativeFrame(
                                    .horizontal, count: 5, span: 2, spacing: 8)
                         }
                     }.scrollTargetLayout()//123627.scrollTargetLayout() // ALONG WITH THIS
                 }.scrollTargetBehavior(.viewAligned)//123625.scrollTargetBehavior(.viewAligned) //.scrollTargetBehavior(.viewAligned) // 123449 THIS WORKS!!!
                     //.padding(.vertical, 8)
                     .fixedSize(horizontal: false, vertical: true)
                     .background(.thinMaterial)
             }
    }
}
```




### allowedDynamicRange

```swift
struct AsyncNew: View { // AsyncImage new
    @State var show = false
    var body: some View {
        AsyncImage(url: URL(string: "https://developer.apple.com/visionos/images/xros-overview-large_2x.png")) // 130646
            .allowedDynamicRange(.high) // 130700
    }
}
```



### accZoomAction

```swift

struct AccView: View {
    @State var show = false
    var body: some View {
       Image(systemName: "sun.min.fill")
            .accessibilityZoomAction { action in // 1301004
                switch action.direction {
                case .zoomIn:
                    print("Zoom by 0.5")
                case .zoomOut:
                    print("Zoom out by 0.5")
                }
            }
    }
}

```




### MapControls
```swift

import MapKit
struct CleversMaps: View { // 07/06
     var loc = CLLocationCoordinate2D(
        latitude: CLLocationDegrees(floatLiteral: 37.3353),
        longitude: CLLocationDegrees(floatLiteral: -122.0097))
    
    
    var body: some View {
        Map {
            Marker("Apple Park", coordinate: loc)
            UserAnnotation() // 145118
        }.mapControls { // 145130
            MapUserLocationButton() //145151
            MapCompass() // 145143
        }
    }
}
```




### TableColumnCustomization

```swift
struct Sight: Identifiable {
    var id = UUID()
    var name: String
    var age: String
    var children: [Sight] // 160818 recursive ?
}

struct SightTable: View { // 150932 customize
    
    @SceneStorage("ColumnCustomization") // 154525 Needed !!!!
    var tcustomize: TableColumnCustomization<Sight> //= TableColumnCustomization()
    
   // @State var animals = [Sight(name: "JK", age: "23")]
    @State var animals = [Sight(name: "JK", age: "23", children: [.init(name: "A", age: "12", children: [])])]
    
   // private var columnCustomization: TableColumnCustomization<DogSighting>
    @State private var selectedSighting: Sight.ID?
    var body: some View {
        Table(animals, selection: $selectedSighting, columnCustomization: $tcustomize) { // 150733
            TableColumn("Name", value: \.name)
                .customizationID("name") // 151237
            
            TableColumn("Age", value: \.age)
                .customizationID("age") // 151237
        }
    }
}
```


### DiscosureTableRow
```swift
struct GenericViewppp: View {
    @State var animals = [Sight(name: "JK", age: "23", children: [.init(name: "A", age: "12", children: [])])]
    
    var body: some View {
        Table(of: Sight.self){ // 160616
            TableColumn("Name", value: \.name)
                .customizationID("name") // 151237
        } rows: {
            ForEach(animals) { animal in
                DisclosureTableRow(animal) { // 160433
                    ForEach(animal.children) { i in
                        TableRow(i)
                    }
                }
            }
        }
    }
} // 190957
```



### Programattic expansion

```swift

struct ExpandView: View {
    @State var show = false
    var body: some View {
        List {
            Section("Hello", isExpanded: $show){
               Text("Hello")
            }
            
            
            // 162859
        }
    }
}
```



### alternatingRowBackgrounds
### tableColumnHeaders
```swift

struct yGenericView: View {
    @State var animals = [Sight(name: "JK", age: "23", children: [.init(name: "A", age: "12", children: [])])]
    @State var show = false
    
    var body: some View {
        Table(animals) { // 150733
            TableColumn("Name", value: \.name)
                .customizationID("name") // 151237
            
        }//.alternatingRowBackgrounds(.enabled) // 163520 macOS only
        //  .tableColumnHeaders(.hidden) // 163620
    }
    
    // Do: Advanced visual effect
    // 16:38:55 hover menu highlight
}
```


### .hoverEffect(.highlight)

```swift
struct HGenericView: View {
    @State var show = false
    var body: some View {
        Button("Show"){
            show.toggle()
        }.hoverEffect(.highlight) // 165211
    }
}
```


## palleteSelectionEffect

```swift
struct MenuPick: View {
    @State private var selectedColor = TagColor.blue
    
    var body: some View {
        Menu("K") { // 172337 as BC
            
           Picker("Tag color", selection: $selectedColor){
                ForEach(TagColor.allCases){ // 1080500 $0 i mandatory to use !!!
                    Label($0.rawValue.capitalized, systemImage: "tag")
                        .tint($0.color)
                        .tag($0)
                }
            }.paletteSelectionEffect(.symbolVariant(.fill)) // 172603 fill 09
                .pickerStyle(.palette) // 172724
        }
    }
    
    enum TagColor: String, CaseIterable, Identifiable {
        case blue
        case brown
        case green
        case yellow

        var id: Self { self }

        var color: Color {
            switch self {
            case .blue: return .blue
            case .brown: return .brown
            case .green: return .green
            case .yellow: return .yellow
            }
        }
    }
}
```





### ContentUnavilableView

```swift
163410 ha
struct CAView: View {
    @State var show = false
    var body: some View {
        ContentUnavailableView {
            Label("A", image: "sun.min.fill")
        } description: {
            Text("234237")
        } // 234028
    }
}
```



### DonutChart
163630 08/06 stwaberry nostalgia 
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
                }// 12557
        } // 125514
        .subscriptionStoreButtonLabel(.multiline) // 163720
        .subscriptionStorePickerItemBackground(.thinMaterial) // 163752
        .storeButton(.visible, for: .redeemCode) // 08/06 163811
        //163823
      
    }
}
```

* Focusable is Available in iOS  
* Visual Effect more in depth NOW







