## AssistentIntent

```swift
import SwiftUI
import AppIntents

@main
struct AssistantIntentTestApp: App {
   
    let mana: ModelManager
    
    init(){
        let man = ModelManager()
        AppDependencyManager.shared.add(dependency: man)
        mana = man // Works!
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(mana)
                
        }
    }
}
```


```swift

@MainActor @Observable
final class ModelManager: ObservableObject, Sendable {
    var names = ["Filip", "Petr", "Jana"]
    var backup = ["Filip", "Petr", "Jana"]
    var searchText = ""
    
    func search(search: String){
        names = backup
        names = names.filter {$0.starts(with: search)}
    }
}


struct ContentView: View {
    @Environment(ModelManager.self) private var model
    
    var body: some View {
        NavigationStack {
            
            Button("Filter names with J"){
                model.search(search: "J")
            }
            
            Button("Reset"){
                model.names = model.backup
            }
            
            List(model.names, id: \.self){ name in
                Text(name)
            }
        }
    }
}


struct ShortuctsProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: NextIntent(),
                    phrases: ["Filter names"],
                    shortTitle: "Filter",
                    systemImageName: "sparkle.magnifyingglass")
    }
    
    static var shortcutTileColor: ShortcutTileColor = .grayGreen
}


@AssistantIntent(schema: .system.search)
struct NextIntent: AppIntent {
    static var searchScopes: [StringSearchScope] = [.general]
    
   // @Parameter(title: "Criteria")
    var criteria: StringSearchCriteria
    
    @Dependency
    var model: ModelManager
    
    @MainActor
    func perform() async throws -> some IntentResult {
        model.search(search: criteria.term)
        return .result()
    }
}

```
