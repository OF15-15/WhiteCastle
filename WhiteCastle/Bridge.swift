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
