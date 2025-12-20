//
//  BookListView.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/6/25.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Query var books: [PersistentBook]
    @State var showAddBookSheet: Bool = false
    @State var newBook = Book(title: "", author: "",detail: "")
    
    var body: some View {
        NavigationStack{
            
            List(books, id: \.self.id) {
                bookInList in NavigationLink(destination: DetailView(book: bookInList)){
                    BookListItem(book: bookInList)
                }
            }//END: List
            .navigationBarTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add"){showAddBookSheet.toggle()})
            .sheet(isPresented: $showAddBookSheet){
               // if(newBook.title.isEmpty){
                 //   books.append(newBook)
               // }//END: if
        }
            content:{
                AddEditView()
        }//END: content
        }//END: NavigationStack
        
    }
}
