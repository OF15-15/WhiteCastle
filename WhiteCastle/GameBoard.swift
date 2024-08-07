//
//  GameBoard.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import Foundation

struct GameBoard {
    // var gardenPlantRed, gardenPlantBlack, gardenPlantWhite: Garden
    // var gardenStoneRed, gardenStoneBlack, gardenStoneWhite: Garden
    
    var wellTop, wellBottom: Resource
    
    var diplomatCards: [DiplomatCard]
    var stewardCards: [StewardCard]
    
    var castleRooms: [CastleRoom]
    // TBD daimyo var castleThird: CastleTop
    
    var trainingYardFive, trainingYardThree, trainingYardOne: Action
    
    // var players: [Player]
    
    
    init() {
        var comps = Components()
        // setup guide
        
        // shuffle first / second level cards
        var startActionCards = comps.startActionCards.shuffled()
        var startResourceCards = comps.startResourceCards.shuffled()
        stewardCards = comps.stewardCards.shuffled()
        diplomatCards = comps.diplomatCards.shuffled()
        
        // put a card in each of the open slots
        // top castle card
        
        castleRooms = []
        
        var diceTiles = comps.diceTiles.shuffled()
        
        var oneOfEach: [DiceTile] = []
        for i in 1...diceTiles.count {
            if diceTiles[i].color == .red {
                oneOfEach.append(diceTiles.remove(at: i))
                break
            }
        }
        for i in 1...diceTiles.count {
            if diceTiles[i].color == .black {
                oneOfEach.append(diceTiles.remove(at: i))
                break
            }
        }
        for i in 1...diceTiles.count {
            if diceTiles[i].color == .white {
                oneOfEach.append(diceTiles.remove(at: i))
                break
            }
        }
        
        
        for _ in 1...3 {
            var lastDT = 1
            if oneOfEach.last!.color == diceTiles.first!.color {
                while diceTiles.first!.color == diceTiles[lastDT].color {
                    lastDT += 1
                }
            }
            castleRooms.append(CastleRoom(card: stewardCards.popLast()!, level: .first, diceTiles: [oneOfEach.popLast()!, diceTiles.removeFirst(), diceTiles.remove(at: lastDT)]))
        }
        
        for _ in 1...2 {
            var lastDT = 1
            while diceTiles.first!.color == diceTiles[lastDT].color {
                lastDT += 1
            }
            castleRooms.append(CastleRoom(card: diplomatCards.popLast()!, level: .second, diceTiles: [diceTiles.removeFirst(), diceTiles.remove(at: lastDT)]))
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
        trainingYardFive = TwoAction(yardTiles[2].yellow, yardTiles[0].blue)
        
        
        // bridges / rounds / players
                
        // turn order
        // random src (p+1) add sac below each
        // in opposite order: choos one pair
        // decree card
    }
}
