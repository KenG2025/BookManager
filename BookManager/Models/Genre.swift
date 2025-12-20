// Genre.swift
import Foundation

enum Genre: String, CaseIterable, Codable, Sendable {
    case unknown
    case classic
    case fiction
    case nonFiction
    case fantasy
    case mystery
    case biography
    case science
    case history
    // add others as needed
}
