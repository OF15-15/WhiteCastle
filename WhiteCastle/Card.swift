//
//  Card.swift
//  WhiteCastle
//
//  Created by Ich on 06.08.24.
//

enum CardType {
    case startAction
    case startRessource
    case firstLevel
    case secondLevel
}


class Card {
    let cardType: CardType
    let top: Action
    let middle: Action
    let bottom: Action
    let lantern: (Player) -> Void
    
    init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: @escaping (Player) -> Void) {
        self.cardType = cardType
        self.top = top
        self.middle = middle
        self.bottom = bottom
        self.lantern = lantern
    }
}

class StartActionCard: Card {
    convenience init(action: Action) {
        let lanternClosure = { (player: Player) -> Void in
            player.gainInfluence(1)
        }
        self.init(cardType: .startAction, top: action, middle: action, bottom: action, lantern: lanternClosure)
    }
    
    override init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: @escaping (Player) -> Void) {
        super.init(cardType: cardType, top: top, middle: middle, bottom: bottom, lantern: lantern)
    }
}

class StartRessourceCard: Card {
    // TBD ressource generation
    convenience init(ressource: Ressource) {
        let lanternClosure = { (player: Player) -> Void in
            player.gainResources(type: ressource, amount: 1)
        }
        self.init(cardType: .startRessource, top: Action(), middle: Action(), bottom: Action(), lantern: lanternClosure)
    }
    
    override init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: @escaping (Player) -> Void) {
        super.init(cardType: cardType, top: top, middle: middle, bottom: bottom, lantern: lantern)
    }
}

class FirstLevelCard: Card {
    convenience override init(top: Action, middle: Action, bottom: Action) {
        let lanternClosure = { (player: Player) -> Void in
            player.gainCoins(1)
        }
        self.init(cardType: .firstLevel, top: top, middle: middle, bottom: bottom, lantern: lanternClosure)
    }
        
    override init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: @escaping (Player) -> Void) {
        super.init(cardType: cardType, top: top, middle: middle, bottom: bottom, lantern: lantern)
    }
}

class SecondLevelCard: Card {
    convenience override init(top: Action, middle: Action, bottom: Action) {
        let lanternClosure = { (player: Player) -> Void in
            player.gainPoints(1)
        }
        self.init(cardType: .firstLevel, top: top, middle: middle, bottom: bottom, lantern: lanternClosure)
    }
        
    override init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: @escaping (Player) -> Void) {
        super.init(cardType: cardType, top: top, middle: middle, bottom: bottom, lantern: lantern)
    }
}
