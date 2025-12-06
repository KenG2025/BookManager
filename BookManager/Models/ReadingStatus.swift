//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Ken Gonzalez on 12/4/25.
//

// This will be an enum that will determine all the possible ReadingStatus
// so that we know what books I want to read, which books I am currentlu reading, and which books I have finished reading.

//Value is saved as a String.
//Implements caseIterable protocol so we caniterate through cases.
// Hashable makes then easy to access.
// Codable makes it possible to save them into json format.

enum ReadingStatus: String, CaseIterable, Hashable, Codable {
    case planToRead = "Plan to read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    //Base case
    case unknown = "Unknown"
    
}
