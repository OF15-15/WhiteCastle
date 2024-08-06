//
//  GameBoard.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import Foundation

struct GameBoard {
    var gardenPlantRed, gardenPlantBlack, gardenPlantWhite: Garden
    var gardenStoneRed, gardenStoneBlack, gardenStoneWhite: Garden
    
    var wellTop, wellBottom: Resource
    
    var diplomatCards: [DiplomatCard]
    var stewardCards: [StewardCard]
    
    var castleFirstLeft, castleFirstMiddle, castleFirstRight: CastleRoom
    var castleSecondLeft, castleSecondRight: CastleRoom
    var castleThird: CastleTop
    
    var trainingYard5, trainingYard3, trainingYard1: TrainingYard
    
    var players: [Player]
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
        
        // all three colors in top spot, first level
        // in number order: rest of dice tiles
        // 6-10 if all tiles same color -> tile into next available space
        // well tiles
        
        // shuffle plant / stone stack, one card onto each spot
        
        // 4 randomly selected yard tiles
        
        // bridges / rounds / players
        
        // turn order
        // random src (p+1) add sac below each
        // in opposite order: choos one pair
        // decree card
    }
}
