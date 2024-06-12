
enum Dest: Hashable {
    case home
    case search
    case settings
    case trends
}

enum ADest {
    case filip
    case petr
    case jana
}


class Cat {
    var name: String
    var icon: String
    var cat: ADest
    init(name: String, icon: String, cat: ADest) {
        self.name = name
        self.icon = icon
        self.cat = cat
    }
}



struct AGenericView: View {
    let categories: [Cat] = [
        .init(name: "Filip", icon: "sun.min.fill", cat: .filip),
        .init(name: "Petr", icon: "sun.min.fill", cat: .petr),
        .init(name: "Jana", icon: "sun.min.fill", cat: .jana)
    ]
    
    @State var selection: ADest = .filip
    @AppStorage("custom") var customization: TabViewCustomization
    
    
    var body: some View {
        TabView(selection: $selection) { // UIKitTabBarController
            Tab("Watch now", systemImage: "play", value: .jana) {
                Text("Watch now")
            }
            
            Tab("Hello", systemImage: "play", value: .filip) {
                Text("M")
            }.customizationID("m")
                
            TabSection {
            
                ForEach(categories, id: \.name) { category in
                    Tab(category.name, systemImage: category.icon, value: category.cat) {
                        Text("View \(category.cat)")
                    }
                    .customizationID(category.name)
                }
               
            } header: {
                Label("Collections", systemImage: "folder")
            }.customizationID("a")
            
            
        }.tabViewStyle(.sidebarAdaptable)
            .tabViewCustomization($customization)
    }
}
