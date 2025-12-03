//
//  DetailView.swift
//  BookManager
//
//  Created by Ken Gonzalez on 11/22/25.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var book: Book
    @State var showEditBookSheet: Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Image(book.coverImage)
                        .resizable()
                        .frame(width: 100, height: 150)
                        .padding(.vertical,20)
                    VStack{
                        Text(book.title)
                            .font(.largeTitle)
                        Text("by \(book.author == "" ? "unknown" : book.author)")
                        //ternery operator
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }//END: VStack

                }//END: HStack
                .navigationBarItems(trailing: Button("Edit"){
                    showEditBookSheet.toggle()})
                .sheet(isPresented: $showEditBookSheet){
                    AddEditView(bookToEdit: $book)
                }
                    
                Text(book.detail)
                    .padding(.horizontal, 20)
            }//END VStack
        }//END ScrollView
    }//END body
}//END struct
