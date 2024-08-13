//
//  Card.swift
//  WhiteCastle
//
//  Created by Ich on 06.08.24.
//

enum CardType: Codable {
    case startAction
    case startResource
    case steward
    case diplomat
}


class Card: Codable {
    let cardType: CardType
    let top: Action
    let middle: Action
    let bottom: Action
    let lantern: Action
    
    init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: Action) {
        self.cardType = cardType
        self.top = top
        self.middle = middle
        self.bottom = bottom
        self.lantern = lantern
    }
}

class StartActionCard: Card {
    convenience init(action: Action) {
        self.init(cardType: .startAction, top: action, middle: action, bottom: action, lantern: GainAction(.influence, 1))
    }
    
    override init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: Action) {
        super.init(cardType: cardType, top: top, middle: middle, bottom: bottom, lantern: lantern)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}

class StartResourceCard: Card {
    var food, iron, pearls, coins, seals, any, decree: Int
    
    convenience init(lanternResource: Resource, food: Int, iron: Int, pearls: Int, coins: Int, seals: Int, any: Int, decree: Int) {
        self.init(cardType: .startResource, top: Action(), middle: Action(), bottom: Action(), lantern: GainAction(lanternResource, 1))
        
        self.food = food
        self.iron = iron
        self.pearls = pearls
        self.coins = coins
        self.seals = seals
        self.any = any
        self.decree = decree
    }
    
    convenience init() {
        self.init(cardType: .startResource, top: Action(), middle: Action(), bottom: Action(), lantern: Action())
    }
    
    override init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: Action) {
        self.food = 0
        self.iron = 0
        self.pearls = 0
        self.coins = 0
        self.seals = 0
        self.any = 0
        self.decree = 0
        
        super.init(cardType: cardType, top: top, middle: middle, bottom: bottom, lantern: lantern)
    }
    enum CodingKeys: String, CodingKey {
        case food
        case iron
        case pearls
        case coins
        case seals
        case any
        case decree
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        food = try container.decode(Int.self, forKey: .food)
        iron = try container.decode(Int.self, forKey: .iron)
        pearls = try container.decode(Int.self, forKey: .pearls)
        coins = try container.decode(Int.self, forKey: .coins)
        seals = try container.decode(Int.self, forKey: .seals)
        any = try container.decode(Int.self, forKey: .any)
        decree = try container.decode(Int.self, forKey: .decree)
        try super.init(from: decoder)
    }
}

class StewardCard: Card {
    convenience init(top: Action, middle: Action, bottom: Action) {
        self.init(cardType: .steward, top: top, middle: middle, bottom: bottom, lantern: GainAction(.coins, 1))
    }
        
    override init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: Action) {
        super.init(cardType: cardType, top: top, middle: middle, bottom: bottom, lantern: lantern)
    }
    
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}

class DiplomatCard: Card {
    convenience init(top: Action, bottom: Action, bottomTwo: Bool) {
        if bottomTwo {
            self.init(cardType: .diplomat, top: top, middle: bottom, bottom: bottom, lantern: GainAction(.points, 1))
        }
        else {
            self.init(cardType: .diplomat, top: top, middle: top, bottom: bottom, lantern: GainAction(.points, 1))
        }
    }
        
    override init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: Action) {
        super.init(cardType: cardType, top: top, middle: middle, bottom: bottom, lantern: lantern)
    }
    
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}
