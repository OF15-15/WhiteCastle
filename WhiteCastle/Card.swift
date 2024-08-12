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


class Card {
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
}

class StewardCard: Card {
    convenience init(top: Action, middle: Action, bottom: Action) {
        self.init(cardType: .steward, top: top, middle: middle, bottom: bottom, lantern: GainAction(.coins, 1))
    }
        
    override init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: Action) {
        super.init(cardType: cardType, top: top, middle: middle, bottom: bottom, lantern: lantern)
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
}
