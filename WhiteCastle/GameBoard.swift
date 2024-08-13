//
//  GameBoard.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import Foundation

struct GameBoard: Codable {
    // var gardenPlantRed, gardenPlantBlack, gardenPlantWhite: Garden
    // var gardenStoneRed, gardenStoneBlack, gardenStoneWhite: Garden
    
    var wellTop, wellBottom: Resource
    
    var diplomatCards: [DiplomatCard]
    var stewardCards: [StewardCard]
    
    var castleRooms: [CastleRoom]
    // TBD daimyo var castleThird: CastleTop
    
    var trainingYardFive, trainingYardThree, trainingYardOne: Action
    
    var players: [Player]
    
    var redBridge, blackBridge, whiteBridge: Bridge
    var bridges: [Bridge]
    
    init() {
        self.init(playerCount: 4)
    }
    
    
    init(playerCount: Int) {
        let comps = Components()
        // setup guide
        
        // shuffle first / second level cards
        var startActionCards = comps.startActionCards.shuffled()
        var startResourceCards = comps.startResourceCards.shuffled()
        stewardCards = comps.stewardCards.shuffled()
        diplomatCards = comps.diplomatCards.shuffled()
        
        // put a card in each of the open slots
        // top castle card
        
        castleRooms = []
        
        var redDiceTiles = comps.redDiceTiles.shuffled()
        var blackDiceTiles = comps.blackDiceTiles.shuffled()
        var whiteDiceTiles = comps.whiteDiceTiles.shuffled()
        
        var firstThreeDiceTiles = [redDiceTiles.removeLast(), blackDiceTiles.removeLast(), whiteDiceTiles.removeLast()]
        var diceTiles = redDiceTiles + blackDiceTiles + whiteDiceTiles
        diceTiles.shuffle()
        
        for _ in 1...3 {
            var lastDT = 0
            if firstThreeDiceTiles.last!.color == diceTiles.last!.color {
                while diceTiles.last!.color == diceTiles[lastDT].color {
                    lastDT += 1
                }
            }
            castleRooms.append(FirstLevelCastleRoom(card: stewardCards.removeLast(),
                                                    topTile: firstThreeDiceTiles.removeLast(),
                                                    middleTile: diceTiles.removeLast(),
                                                    bottomTile: diceTiles.remove(at: lastDT)))
        }
        
        for _ in 1...2 {
            var lastDT = 1
            while diceTiles.last!.color == diceTiles[lastDT].color {
                lastDT += 1
            }
            castleRooms.append(SecondLevelCastleRoom(card: diplomatCards.removeLast(),
                                                    topTile: diceTiles.removeLast(),
                                                    bottomTile: diceTiles.remove(at: lastDT)))
        }
        
        wellTop = diceTiles[0].resource
        wellBottom = diceTiles[1].resource
        
        
        // all three colors in top spot, first level
        // in number order: rest of dice tiles
        // 6-10 if all tiles same color -> tile into next available space
        // well tiles
        
        // shuffle plant / stone stack, one card onto each spot
        
        // 4 randomly selected yard tiles
        
        let yardTiles = comps.yardTiles.shuffled()
        
        trainingYardOne = yardTiles[0].yellow
        trainingYardThree = yardTiles[1].blue
        trainingYardFive = TwoAction(yardTiles[2].yellow, yardTiles[3].blue)
        
        
        // bridges / rounds / players
        redBridge = Bridge(color: .red, count: 5)
        blackBridge = Bridge(color: .black, count: 5)
        whiteBridge = Bridge(color: .white, count: 5)
        bridges = [redBridge, blackBridge, whiteBridge]
                
        // turn order
        // random src (p+1) add sac below each
        // in opposite order: choose one pair
        // decree card
        players = [Player(startResourceCard: comps.startResourceCards[0], startActionCard: comps.startActionCards[0]),
                   Player(startResourceCard: comps.startResourceCards[1], startActionCard: comps.startActionCards[1]),
                   Player(startResourceCard: comps.startResourceCards[2], startActionCard: comps.startActionCards[2]),
                   Player(startResourceCard: comps.startResourceCards[3], startActionCard: comps.startActionCards[3])]
    }
}
