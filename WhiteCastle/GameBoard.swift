//
//  GameBoard.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import Foundation

struct GameBoard {
    let gardenPlantRed, gardenPlantBlack, gardenPlantWhite: Garden
    let gardenStoneRed, gardenStoneBlack, gardenStoneWhite: Garden
    
    let wellTop, wellBottom: Resource
    
    let castleFirstLeft, castleFirstMiddle, castleFirstRight: CastleRoom
    let castleSecondLeft, castleSecondRight: CastleRoom
    let castleThird: CastleTop
    
    let trainingYard5, trainingYard3, trainingYard1: TrainingYard
    
    
    init() {
        // setup guide
        
        // shuffle first / second level cards
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
