//
//  Game.swift
//  WhiteCastle
//
//  Created by Ich on 13.08.24.
//
import Foundation


struct Game: Identifiable, Codable {
    var player: Int
    var board: GameBoard
    var id = UUID()
    
    func getPlayer() -> Player {
        return board.players[player]
    }
    
    init() {
        board = GameBoard(playerCount: 4)
        player = Int.random(in: 0..<board.players.count)
    }
    
}
