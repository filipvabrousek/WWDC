//
//  AssistantIntentTestApp.swift
//  AssistantIntentTest
//
//  Created by Filip Vabroušek on 12.06.2024.
//

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



/*
// Not working
 @main
 struct AssistantIntentTestApp: App {
    
     let man = ModelManager()
     
     init(){
         let man = ModelManager()
         AppDependencyManager.shared.add(dependency: man)
     }
     var body: some Scene {
         WindowGroup {
             ContentView()
                 .environment(man)
                 
         }
     }
 }

 */
