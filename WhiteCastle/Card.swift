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
    
    init(cardType: CardType, top: Action, middle: Action, bottom: Action, lantern: Action) {
        self.cardType = cardType
        self.top = top
        self.middle = middle
        self.bottom = bottom
        self.lantern = lantern
    }
}

class StartActionCard: Card {
    override init(action: Action) {
        
        super.init(cardType: .startAction, top: action, middle: action, bottom: action, lantern: lanternAction)
    }
}
