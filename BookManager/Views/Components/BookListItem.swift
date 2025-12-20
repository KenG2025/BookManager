//
//  BookListItem.swift
//  BookManager
//
//  Created by Ken Gonzalez on 11/22/25.
//

import SwiftUI

struct BookListItem: View {
    let book: PersistentBook
   
    
    var body: some View {
        HStack{
//            Image(book.coverImage)
//                .resizable()
//                .scaledToFit()
//                .frame(maxWidth: 60, maxHeight: 48)
            VStack(alignment: .leading){ //internatiolnalization <-- i18n
                //LTR <> RTL
                Text(book.title)
                Text(book.author)
            }
            
        }
    }
}

