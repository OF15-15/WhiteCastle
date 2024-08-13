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

class CastleRoom: Codable {
    var card: Card
    var level: Level
    
    var actions: [Action]
    
    init(card: Card, level: Level) {
        self.card = card
        self.level = level
        self.actions = []
    }
    
    enum CodingKeys: String, CodingKey {
            case card
            case level
            case actions
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            card = try container.decode(Card.self, forKey: .card)
            level = try container.decode(Level.self, forKey: .level)
            actions = try container.decode([Action].self, forKey: .actions)
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
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
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
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}
