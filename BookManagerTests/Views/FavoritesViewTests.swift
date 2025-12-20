//
//  FavoritesViewTests.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/16/25.
//

import Testing
@testable import BookManager

@Test("Test filterFavoriteBook function")
    func testfilterFavoriteBook() {
            
        // Arrange
        let books = [
            PersistentBook(title:"Book 1", isFavorite: true),
            PersistentBook(title:"Book 2"),
            PersistentBook(title:"Book 3"),
        ]
        
        // Act
        let favoriteBooks = filterFavoriteBooks(books: books)
        // result of this code: []
        
        // Assert
        #expect(favoriteBooks.count == 1)
        #expect(favoriteBooks.first?.title == "Book 1")
    }

@Test("Test filterFavoriteBook function with genre and status")
    func testFilterFavoriteBookWithGenreAndStatus() {
        // Arrange
        let books = [
            PersistentBook(title:"Book 1", genre:.classic, isFavorite: true),
            PersistentBook(title:"Book 2", status:.reading, genre:.fantasy, isFavorite: true,),
            PersistentBook(title:"Book 3"),
        ]
        let selectedGenre: Genre? = .fantasy
        let selectedStatus: ReadingStatus? = .reading
        
        // Act
        let favoriteBooks = filterFavoriteBooks(books: books, selectedGenre: selectedGenre,  selectedStatus: selectedStatus )
        // result of this code: []
        
        // Assert
        #expect(favoriteBooks.count == 1)
        #expect(favoriteBooks.first?.title == "Book 2")
        
    }
