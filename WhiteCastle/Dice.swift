//
//  Dice.swift
//  WhiteCastle
//
//  Created by Ich on 09.08.24.
//
import Foundation


struct Dice: Identifiable {
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
    
}


struct Bridge {
    let color: DColor
    var dices: [Dice]
    var left: Dice?
    var right: Dice?
    
    init(color: DColor, count: Int) {
        self.color = color
        dices = []
        for _ in 1...count {
            dices.append(Dice(color))
        }
        left = dices.first
        right = dices.last
    }
    
    mutating func popLeft() -> Dice {
        let l = dices.removeFirst()
        if dices.count > 0 {
            left = dices[0]
        }
        else {
            left = nil
        }
        return l
    }
    
    mutating func popRight() -> Dice {
        let r = dices.removeLast()
        if dices.count > 0 {
            right = dices[-1]
        }
        else {
            right = nil
        }
        return r
        
    }
    
    
}
