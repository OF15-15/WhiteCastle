//
//  CastleRoom.swift
//  WhiteCastle
//
//  Created by Ich on 06.08.24.
//

enum Level: Codable {
    case first
    case second
}

class CastleRoom {
    var card: Card
    var level: Level
    
    var actions: [Action]
    
    init(card: Card, level: Level) {
        self.card = card
        self.level = level
        self.actions = []
    }
    
}


class FirstLevelCastleRoom: CastleRoom {
    init(card: Card, topTile: DiceTile, middleTile: DiceTile, bottomTile: DiceTile) {
        super.init(card: card, level: .first)
        self.actions = [
            DiceAction(actionValue: 3, color: topTile.color, action: card.top),
            DiceAction(actionValue: 3, color: middleTile.color, action: card.middle),
            DiceAction(actionValue: 3, color: bottomTile.color, action: card.bottom)
        ]
    }
}

class SecondLevelCastleRoom: CastleRoom {
    init(card: Card, topTile: DiceTile, bottomTile: DiceTile) {
        super.init(card: card, level: .second)
        self.actions = [
            DiceAction(actionValue: 4, color: topTile.color, action: card.top),
            DiceAction(actionValue: 4, color: bottomTile.color, action: card.bottom)
        ]
    }
}
