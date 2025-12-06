//
//  AddEditView.swift
//  BookManager
//
//  Created by Ken Gonzalez on 11/25/25.
//

import SwiftUI

struct AddEditView: View {
    @Binding var bookToEdit: Book
    @State var workingBook: Book
    @Environment(\.dismiss) var dismiss
    
    private var isNewBook: Bool{
        bookToEdit.title.isEmpty
    }
    
    @State private var titleText: String
    
    init(bookToEdit: Binding<Book>){
        self._bookToEdit = bookToEdit
        self._workingBook = .init(initialValue: bookToEdit.wrappedValue)
        self._titleText = State(initialValue: bookToEdit.wrappedValue.title.isEmpty ? "Add Book:" : "Edit Book:")
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                // Section creates a "white globe" around all fields.
                // Use divide fields.
                Section(header: Text("Book Details")){
                    // A plain text field
                    TextField("Title", text: $workingBook.title)
                    TextField("Author", text: $workingBook.author)
                    Picker("Genre", selection: $workingBook.genre){
                        ForEach(Genre.allCases, id: \.self) {
                            genre in Text(genre.rawValue).tag(genre)
                        }
                    }
                    
                    TextEditor(text: $workingBook.detail)
                        .frame(minHeight: 150)
                }//END Section
                
                Section(header: Text("My Review")){
                    Picker("Rating", selection: $workingBook.rating){
                        // Special base case
//                        Text("No rating").tag(0)
//                        Text("1").tag(0)
//                        Text("2").tag(0)
//                        Text("3").tag(0)
//                        Text("4").tag(0)
//                        Text("5").tag(0)
                        
                        ForEach(1...5, id: \.self){
                            rating in Text("\(rating)").tag(rating)
                        }
                    }
                }//END Section
                    Picker("Readig Stauts", selection: $workingBook.status){
                        //Enums have a specieal property 'allCases'
                        ForEach(ReadingStatus.allCases, id: \.self) {
                            status in  Text(status.rawValue).tag(status)
                        }//END ForEach
                    }//END Picker
                    TextEditor(text: $workingBook.review)
                        .frame(height: 150)
            }//END Form
            .navigationBarTitle(titleText)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        self.$bookToEdit.wrappedValue = self.workingBook
                        dismiss()
                    }.disabled(workingBook.title.isEmpty)
                }
            }
        }
        
    }
}


