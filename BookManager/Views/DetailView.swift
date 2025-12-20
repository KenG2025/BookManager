//
//  DetailView.swift
//  BookManager
//
//  Created by Ken Gonzalez on 11/22/25.
//

import SwiftUI

struct DetailView: View {
    
    var book: PersistentBook
    @State var showEditBookSheet: Bool = false
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    HStack{
//                        Image(book.coverImage)
//                            .resizable()
//                            .frame(width: 100, height: 150)
//                            .padding(.vertical,20)
                        VStack{
                            Text(book.title)
                                .font(.largeTitle)
                            Text("by \(book.author == "" ? "unknown" : book.author)")
                            //ternery operator
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }//END: VStack
                        
                    }//END: HStack
                    
                    VStack(alignment: .leading, spacing: 15){
                        HStack{
                            if (book.status != .unknown) {
                                CustomCapsule(text: book.status.rawValue, color: .secondary)
                            }
                            if (book.status != .unknown) {
                                CustomCapsule(text: book.genre.rawValue, color: .secondary)
                            }
                            
                            Spacer()
                            
                            //FavoritesToggle(isFavorite: $isFavorite)
                        }
                        Text(book.summary)
                            .padding(.horizontal, 20)
                        if (book.rating == 0) {
                            Text("Not yet rated.")
                        }else{
                            Text("Rating: \(book.rating)\(book.rating == 1 ? "star" : "stars")")
                        }
                        Text("My Review: \(book.review)")
                    }
                    .padding(.horizontal, 20)
                    .navigationBarItems(trailing: Button("Edit"){
                        showEditBookSheet.toggle()})
                    .sheet(isPresented: $showEditBookSheet){
                       AddEditView(book: book)
                    }
                    
                }//END VStack
            }//END ScrollView
        }
    }//END body
}//END struct
