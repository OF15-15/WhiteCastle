//
//  Bridge.swift
//  WhiteCastle
//
//  Created by Ich on 11.08.24.
//

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
        dices.sort()
        if dices.count > 0 {
            left = dices.removeFirst()
        }
        right = dices.popLast()
    }
    
    mutating func popLeft() -> Dice? {
        let l = left
        if dices.count > 0 {
            left = dices[0]
        }
        else {
            left = nil
        }
        return l
    }
    
    mutating func popRight() -> Dice? {
        let r = right
        right = dices.popLast()
        return r
        
    }
    
    
}
