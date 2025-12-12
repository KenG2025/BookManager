//
//  ContentView.swift
//  BookManager
//
//  Created by Ken Gonzalez on 11/22/25.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    
    @State var books = getBooks()
    
    @AppStorage("SETTINGS_THEME") private var selectedTheme: Theme = .light
    @AppStorage(SETTINGS_GRID_COLUMNS) private var gridColumns: Int = 2
    @AppStorage(SETTINGS_ACCENT_COLOR) private var accentColor: Color = .accentColor

    
    var colorScheme: ColorScheme? {
        switch(selectedTheme) {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return nil
        }
    }

    
    var body: some View {
        TabView{
            BookListView(books: $books)
                .tabItem{
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoritesView(books: $books)
                .tabItem{
                    Label("Favorites", systemImage: "heart.fill")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }//END TabView
        .preferredColorScheme(colorScheme)
        .tint(accentColor)
        
    }//}END: body
}//END: struct
