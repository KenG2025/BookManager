//
//  FavoritesView.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/9/25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @AppStorage(SETTINGS_GRID_COLUMNS) var gridColumns: Int = 2
    
    @Query var books: [PersistentBook]
    @State private var isFilterSheetPresented: Bool = false
    @State var selectedGenre: Genre?
    @State var selectedStatus: ReadingStatus?
    
    var gridLayout: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: gridColumns)
    }
    
//    let gridLayout = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
    //Compound Variables -> as soon as books binding variable changes the new variable will compute itself to match the state.
    private var favoriteBooks: [PersistentBook]{
        books.filter { $0.isFavorite
            && (selectedGenre == nil || $0.genre == selectedGenre)
            && (selectedStatus == nil || $0.status == selectedStatus)
        }
        
    }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                HStack{
                    if(selectedGenre != nil){
                        Text("Genre: \(selectedGenre!.rawValue)")
                    }
                    if(selectedGenre != nil){
                        Text("Status: \(selectedStatus!.rawValue)")
                    }
                    LazyVGrid(columns: gridLayout) {
                        ForEach(favoriteBooks, id: \.id) { book in
                            NavigationLink(destination: DetailView(book: book)){
                                StoryCardView(book: book)
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                }
                .navigationBarTitle("My Favorite Books")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {isFilterSheetPresented.toggle()}){
                            Image(systemName: "line.horizontal.3.decrease.circle")
                        }
                    }
                }
                .sheet(isPresented: $isFilterSheetPresented){
                    FilterView(selectedGenre: $selectedGenre, selectedStatus: $selectedStatus)
                }
            }
            
        }
    }
    

                
        
    
}
func filterFavoriteBooks(books: [PersistentBook], selectedGenre: Genre? = nil, selectedStatus: ReadingStatus? = nil) -> [PersistentBook] {
    return books.filter { book in
        book.isFavorite
        && (selectedGenre == nil || book.genre == selectedGenre)
        && (selectedStatus == nil || book.status == selectedStatus)
    }
}
