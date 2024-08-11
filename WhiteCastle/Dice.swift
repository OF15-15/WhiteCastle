//
//  Dice.swift
//  WhiteCastle
//
//  Created by Ich on 09.08.24.
//
import Foundation


struct Dice: Identifiable, Comparable {
    let id = UUID()
    let color: DColor
    let value: Int
    
    init(color: DColor, value: Int) {
        self.color = color
        self.value = value
    }
    
    init(_ color: DColor) {
        self.color = color
        self.value = Int.random(in: 1...6)
    }
    
    static func <(lhs: Dice, rhs: Dice) -> Bool {
        return lhs.value < rhs.value
    }
    static func >(lhs: Dice, rhs: Dice) -> Bool {
        return lhs.value > rhs.value
    }
    static func ==(lhs: Dice, rhs: Dice) -> Bool {
        return lhs.value == rhs.value
    }
    
}
