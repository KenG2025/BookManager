//
//  BookManagerApp.swift
//  BookManager
//
//  Created by Ken Gonzalez on 11/22/25.
//

import SwiftUI
import SwiftData

@main
struct BookManagerApp: App {
    let modelContainer: ModelContainer

    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .modelContainer(modelContainer)
        }
        
    }
    init(){
            do {
                modelContainer = try ModelContainer(
                                        for: PersistentBook.self
                                     )
            } catch {
                fatalError("Failed to load model container")
            }
        }
}
