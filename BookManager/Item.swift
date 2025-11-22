//
//  Item.swift
//  BookManager
//
//  Created by Ken Gonzalez on 11/22/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
