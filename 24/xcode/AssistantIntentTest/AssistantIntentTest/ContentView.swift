//
//  ContentView.swift
//  AssistantIntentTest
//
//  Created by Filip Vabroušek on 12.06.2024.
//

import SwiftUI
import AppIntents

/*
final class Model: ObservableObject, Sendable {
    
    @Published
    var names = ["Filip", "Petr", "Jana"]
    
    @Published
    var backup = ["Filip", "Petr", "Jana"]
    
    @Published
    var searchText = ""
    func search(search: String){
        names = backup
        names = names.filter {$0.starts(with: search)}
    }
}*/


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
 //   @Environment(Model.self) private var model
    
    
    
    var body: some View {
        NavigationStack {
            
            Button("Filter names with J"){
                model.search(search: "J")
            }
            
            Button("Reset"){
                model.names = model.backup
            }
            
            
            List(model.names, id: \.self)
            { name in
                Text(name)
            }//.searchable(text: $model.searchText)
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




/*

@AssistantIntent(schema: .photos.search)
struct FilterIntent: ShowInAppSearchResultsIntent {
    static var searchScopes: [StringSearchScope] = [.general]
    var criteria: StringSearchCriteria
    
    @Dependency
    var model: ModelManager
    
    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        model.search(search: criteria.term)
       // model.names =  model.names.filter {$0.starts(with: criteria.term)}
        return .result(dialog: "Searching \(criteria.term)")
    }
}*/


/*
@AssistantIntent(schema: .system.search)
struct SearchFilterIntent: ShowInAppSearchResultsIntent {
    static var searchScopes: [StringSearchScope] = [.general]
    var criteria: StringSearchCriteria
    
    @Dependency
    var model: ModelManager
    
    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        model.search(search: criteria.term)
      
        return .result(dialog: "Searchinga \(criteria.term)")
    }
}*/

/*
@AssistantIntent(schema: .system.search)
struct SystemSearchIntent {
    static var searchScopes: [StringSearchScope] = [.general]
    var criteria: StringSearchCriteria
    
    func perform() async throws -> some IntentResult {
        .result()
    }
}*/

















/*
@AssistantIntent(schema: .system.search)
struct OpenFilterIntent: OpenIntent {
   
    var target: AssetEntity
    
    @Dependency
    var model: Model
    
    
    
    func perform() async throws -> some IntentResult {
       // model.names =  model.names.filter {$0.starts(with: criteria.term)}
        return .result()
    }
}





@AssistantEntity(schema: .photos.asset)
struct AssetEntity: IndexedEntity {

    // MARK: Static

    static let defaultQuery = AssetQuery()

    // MARK: Properties

    let id: String
    let asset: Asset

    @Property(title: "Title")
    var title: String?

    var creationDate: Date?
    var location: CLPlacemark?
    var assetType: AssetType?
    var isFavorite: Bool
    var isHidden: Bool
    var hasSuggestedEdits: Bool

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(
            title: title.map { "\($0)" } ?? "Unknown",
            subtitle: assetType?.localizedStringResource ?? "Photo"
        )
    }
}

*/




#Preview {
    ContentView()
        //.environmentObject(Model())
}
