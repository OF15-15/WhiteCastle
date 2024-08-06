//
//  Action.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import Foundation

class Action{
    var diceColor: DColor = .all
    var actionValue: Int = 6
    
    init() { }
    
    init(diceColor dCol: DColor, actionValue actVal: Int) {
        diceColor = dCol
        actionValue = actVal
    }
    
    
    func run(player: Player, gameBoard: GameBoard, diceValue: Int) -> Bool{
        if 0 < diceValue && diceValue <= 6 {
            let poss = player.gainCoins(actionValue - diceValue)
            return poss
        }
        return true
    }
}

class WellAction: Action {
    
    override init() {
        super.init(diceColor: .all, actionValue: 1)
    }
    
    override func run(player: Player, gameBoard: GameBoard, diceValue: Int) -> Bool {
        _ = super.run(player: player, gameBoard: gameBoard, diceValue: diceValue)
        _ = player.gainSeals(1)
        
        _ = player.gainResources(type: gameBoard.wellTop, amount: 1)
        _ = player.gainResources(type: gameBoard.wellBottom, amount: 1)
        return true
    }
}
