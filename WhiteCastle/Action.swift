//
//  Action.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

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
        super.init()
    }
    
    private enum CodingKeys: String, CodingKey {
        case color
    }
    
    required init(from decoder: Decoder) throws {
        self.color = try decoder.container(keyedBy: CodingKeys.self).decode(DColor.self, forKey: .color)
        super.init()
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(color, forKey: .color)
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
                    print("foo")
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
                    print("foo")
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
                    print("error 209384")
                }
            }
            //TBD: player.actionCard.black.run()
        case .all:
            print("error 32904")
        }
    }
}

class LanternAction: Action {
    override func run(_ player: Player, _ gameBoard: GameBoard) {
        for lanternCard in player.lanternCards {
            lanternCard.lantern.run(player, gameBoard)
        }
    }
}

class GainAction: Action {
    var resource: Resource
    var amount: Int
    
    init(_ resource: Resource, _ amount: Int) {
        self.amount = amount
        self.resource = resource
        super.init()
    }
    
    private enum CodingKeys: String, CodingKey {
        case resource
        case amount
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resource = try values.decode(Resource.self, forKey: .resource)
        amount = try values.decode(Int.self, forKey: .amount)
        super.init()
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(resource, forKey: .resource)
        try container.encode(amount, forKey: .amount)
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
        super.init()
    }
    
    override func run(_ player: Player, _ gameBoard: GameBoard) {
        firstAction.run(player, gameBoard)
        secondAction.run(player, gameBoard)
    }
    
    enum CodingKeys: String, CodingKey {
        case firstAction
        case secondAction
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstAction = try container.decode(Action.self, forKey: .firstAction)
        secondAction = try container.decode(Action.self, forKey: .secondAction)
        super.init()
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(firstAction, forKey: .firstAction)
        try container.encode(secondAction, forKey: .secondAction)
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
    
    enum CodingKeys: String, CodingKey {
        case amount
        case resource
        case action
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Int.self, forKey: .amount)
        self.resource = try container.decode(Resource.self, forKey: .resource)
        self.action = try container.decode(Action.self, forKey: .action)
        super.init()
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amount, forKey: .amount)
        try container.encode(resource, forKey: .resource)
        try container.encode(action, forKey: .action)
    }
}

class DiceAction: PayAction {
    let actionValue: Int
    
    init(actionValue: Int, color: DColor, action: Action) {
        self.actionValue = actionValue
        super.init(amount: 100, resource: .coins, action: action)
    }
    
    func run(_ player: Player, _ gameBoard: GameBoard, dice: Dice) {
        amount = actionValue - dice.value
        super.run(player, gameBoard)
    }
    
    func possible(_ player: Player, dice: Dice) -> Bool {
        amount = actionValue - dice.value
        return super.possible(player)
    }
    
    enum CodingKeys: String, CodingKey {
        case actionValue
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actionValue = try container.decode(Int.self, forKey: .actionValue)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(actionValue, forKey: .actionValue)
        try super.encode(to: encoder)
    }
}
