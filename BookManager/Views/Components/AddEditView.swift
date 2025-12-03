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
    
    private var titleText: String
    
    init(bookToEdit: Binding<Book>){
        
        self._bookToEdit = bookToEdit
        self._workingBook = .init(initialValue: bookToEdit.wrappedValue)
        self.titleText = bookToEdit.wrappedValue.title.isEmpty ? "Add Book:" : "Edit Book:"
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                TextField("Title", text: $workingBook.title)
                TextField("Author", text: $workingBook.author)
                TextEditor(text: $workingBook.detail)
                    .frame(minHeight: 150)
            }
            .navigationBarTitle("Add Book")
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        self.$bookToEdit.wrappedValue = self.workingBook
                        dismiss()
                    }.disabled(bookToEdit.title.isEmpty)
                }
            }
        }
        
    }
}


