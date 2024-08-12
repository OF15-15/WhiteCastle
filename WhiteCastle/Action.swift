//
//  Action.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import Foundation

class Action: Codable {
    func run(_ player: Player, _ gameBoard: GameBoard) {
        
    }
    
    func possible(_ player: Player) -> Bool {
        return true
    }
}

class WellAction: Action {
    override func run(_ player: Player, _ gameBoard: GameBoard) {
        super.run(player, gameBoard)
        player.gainSeals(1)
        
        player.gainResources(type: gameBoard.wellTop, amount: 1)
        player.gainResources(type: gameBoard.wellBottom, amount: 1)
    }
}

class PlayerBoardAction: Action {
    let color: DColor
    
    init(color: DColor) {
        self.color = color
    }
    
    override func run(_ player: Player, _ gameBoard: GameBoard) {
        switch self.color {
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
                    player.lantern.run(player, gameBoard)
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
                    player.lantern.run(player, gameBoard)
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
    override func run(_ player: Player, _ gameBoard: GameBoard) {
        for lanternCard in player.lanternCards {
            lanternCard.lantern(player)
        }
    }
}

class GainAction: Action {
    var resource: Resource
    var amount: Int
    
    init(_ resource: Resource, _ amount: Int) {
        self.amount = amount
        self.resource = resource
    }
    
    override func run(_ player: Player, _ gameBoard: GameBoard) {
        player.gainResources(type: resource, amount: amount)
    }
}

class GardenAction: Action {
    
}

class YardAction: Action {
    
}

class CastleAction: Action {
    
}

class TwoAction: Action {
    var firstAction: Action
    var secondAction: Action
    
    init(_ firstAction: Action, _ secondAction: Action) {
        self.firstAction = firstAction
        self.secondAction = secondAction
    }
    
    override func run(_ player: Player, _ gameBoard: GameBoard) {
        firstAction.run(player, gameBoard)
        secondAction.run(player, gameBoard)
    }
    
}

class PayAction: Action {
    var amount: Int
    var resource: Resource
    var action: Action
    
    init(amount: Int, resource: Resource, action: Action) {
        self.amount = amount
        self.resource = resource
        self.action = action
        super.init()
    }
    
    override func run(_ player: Player, _ gameBoard: GameBoard) {
        if player.gainResources(type: resource, amount: amount) {
            action.run(player, gameBoard)
        }
    }
    
    override func possible(_ player: Player) -> Bool {
        if player.gainResources(type: resource, amount: -amount) {
            player.gainResources(type: resource, amount: amount)
            return true
        }
        return false
    }
    
    
}

class DiceAction: PayAction {
    let actionValue: Int
    
    init(actionValue: Int, color: DColor, action: Action) {
        self.actionValue = actionValue
        super.init(amount: 100, resource: .coins, action: action)
    }
    
    func run(_ player: Player, _ gameBoard: GameBoard, dice: Dice) {
        amount = actionValue-dice.value
        super.run(player, gameBoard)
    }
    
    func possible(_ player: Player, dice: Dice) -> Bool {
        amount = actionValue-dice.value
        return super.possible(player)
    }
}
