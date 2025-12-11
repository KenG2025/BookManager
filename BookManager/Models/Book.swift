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
    var coverImage: String = "default_book"
    var detail: String
    
    var review: String = ""
    var status: ReadingStatus = .unknown
    var rating: Int = 0
    var genre: Genre = .unknown
    
    var isFavoritee: Bool = false
}
    
