//
//  StandardValues.swift
//  WhiteCastle
//
//  Created by Ich on 06.08.24.
//

enum DColor: String, CaseIterable, Identifiable {
    case red
    case black
    case white
    case all
    var id: String { self.rawValue }
}

enum Resource {
    case food
    case iron
    case pearls
    case seals
    case coins
    case influence
    case points
    case any
}
