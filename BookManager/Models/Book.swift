//
//  book.swift
//  BookManager
//
//  Created by Ken Gonzalez on 11/22/25.
//

import Foundation

struct Book: Identifiable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var coverImage: String = ""
    var detail: String
    
    
}
