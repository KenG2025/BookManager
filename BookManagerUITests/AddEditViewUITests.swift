//
//  AddEditViewUITests.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/20/25.
//

import XCTest

class AddEditViewUITests: XCTestCase {
    @MainActor
    func testAddBooksWorks() throws {
        let app = XCUIApplication()
        app.launch()
        
        let currentBookCount = app.collectionViews.firstMatch.cells.count
       // XCTAssertEqual(currentBookCount, 5)
        //Click the Add Book button
        let addButton = app.buttons["Add"]
        addButton.tap()
        //Check that save button is disabled
        let saveButton = app.buttons["Save Book"]
        XCTAssertFalse(saveButton.isEnabled)
        //Clicl on title field and write
        let titleField = app.textFields["Title of the book"]
        titleField.tap()
        titleField.typeText("New Book \(currentBookCount)")
        //Check that save button is enabled
        print("breakpo[int")
        XCTAssertTrue(saveButton.isEnabled)
        //We can do the same for other fields
        
        //Click save
        saveButton.tap()
        //Check the book is added to the list
        let afterBookCount = app.collectionViews.firstMatch.cells.count
        XCTAssertEqual(afterBookCount, currentBookCount+1)
        
    }
}

