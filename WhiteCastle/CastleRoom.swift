//
//  CastleRoom.swift
//  WhiteCastle
//
//  Created by Ich on 06.08.24.
//

enum Level {
    case first
    case second
}

struct CastleRoom {
    var card: Card
    var level: Level
    var diceTiles: [DiceTile]
}
