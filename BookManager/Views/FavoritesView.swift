//
//  FavoritesView.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/9/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @AppStorage(SETTINGS_GRID_COLUMNS) var gridColumns: Int = 2
    
    @Binding var books: [Book]
    @State private var isFilterSheetPresented: Bool = false
    @State var selecttedGenre: Genre?
    @State var selecttedStatus: ReadingStatus?
    
    var gridLayout: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: gridColumns)
    }
    
  
    //Compound Variables -> as soon as books binding variable changes the new variable will compute itself to match the state.
    private var favoriteBooks: [Binding<Book>]{
        $books.filter { $0.wrappedValue.isFavoritee
            && (selecttedGenre == nil || $0.wrappedValue.genre == selecttedGenre)
            && (selecttedStatus == nil || $0.wrappedValue.status == selecttedStatus)
        }
        
    }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                HStack{
                    if(selecttedGenre != nil){
                        Text("Genre: \(selecttedGenre!.rawValue)")
                    }
                    if(selecttedGenre != nil){
                        Text("Status: \(selecttedStatus!.rawValue)")
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
                    FilterView(selecttedGenre: $selecttedGenre, selecttedStatus: $selecttedStatus)
                }
            }
            
        }
    }
    
    
}
