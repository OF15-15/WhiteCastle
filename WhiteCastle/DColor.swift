//
//  DColor.swift
//  WhiteCastle
//
//  Created by Ich on 11.08.24.
//

enum DColor: String, CaseIterable, Identifiable {
    case red
    case black
    case white
    case all
    var id: String { self.rawValue }
}
