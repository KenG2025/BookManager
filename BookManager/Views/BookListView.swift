//
//  BookListView.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/6/25.
//

import SwiftUI

struct BookListView: View {
    @Binding var books: [Book]
    @State var showAddBookSheet: Bool = false
    @State var newBook = Book(title: "", author: "",detail: "")
    
    var body: some View {
        NavigationStack{
            
            List($books, id: \.self.id) {
                bookInList in NavigationLink(destination: DetailView(book: bookInList)){
                    BookListItem(book: bookInList)
                }
            }//END: List
            .navigationBarTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add"){showAddBookSheet.toggle()})
            .sheet(isPresented: $showAddBookSheet){
                if(newBook.title.isEmpty){
                    books.append(newBook)
                }//END: if
                newBook = Book(title: "", author: "",detail: "")
        }
            content:{
                AddEditView(bookToEdit: $newBook)
        }//END: content
        }//END: NavigationStack
        
    }
}
