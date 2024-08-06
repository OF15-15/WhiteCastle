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

class PlayerBoardAction: Action {
    convenience init(diceColor dCol: DColor) {
        self.init(diceColor: dCol, actionValue: 6)
    }
    override init(diceColor dCol: DColor, actionValue actVal: Int) {
        super.init(diceColor: dCol, actionValue: actVal)
    }
    
    override func run(player: Player, gameBoard: GameBoard, diceValue: Int) -> Bool {
        if !super.run(player: player, gameBoard: gameBoard, diceValue: diceValue) {
            return false
        }
        
        switch self.diceColor {
        case .red:
            let bonuses = 1...(5-player.courtiers)
            for bonus in bonuses {
                switch bonus {
                case 0, 1, 2, 4:
                    player.gainFood(1)
                case 3:
                    player.gainCoins(2)
                case 5:
                    player.gainSeals(1)
                default:
                    raise(43)
                }
            }
            //TBD: player.actionCard.black.run()
        case .black:
            let bonuses = 1...(5-player.gardeners)
            for bonus in bonuses {
                switch bonus {
                case 0, 1, 2, 4:
                    player.gainIron(1)
                case 3:
                    player.lantern.run()
                case 5:
                    player.gainCoins(2)
                default:
                    raise(43)
                }
            }
            //TBD: player.actionCard.black.run()
            
        case .white:
            let bonuses = 1...(5-player.warriors)
            for bonus in bonuses {
                switch bonus {
                case 0, 1, 2, 4:
                    player.gainPearls(1)
                case 3:
                    player.gainSeals(1)
                case 5:
                    player.lantern.run()
                default:
                    raise(43)
                }
            }
            //TBD: player.actionCard.black.run()
        case .all:
            raise(42)
        }
    }
}


class LanternAction: Action {
    override func run(player: Player, gameBoard: GameBoard, diceValue: Int) -> Bool {
        for lanternCard in player.lanternCards {
            lanternCard.lantern()
        }
    }
    
}
