//
//  GameBoard.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import Foundation

struct GameBoard {
    let gardenLeftRed, gardenLeftBlack, gardenLeftWhite: Garden
    let gardenRightRed, gardenRightBlack, gardenRightWhite: Garden
    
    let wellTop, wellBottom: Resource
    
    let castleFirstLeft, castleFirstMiddle, castleFirstRight: CastleRoom
    let castleSecondLeft, castleSecondRight: CastleRoom
    let castleThird: CastleTop
    
    let trainingYard5, trainingYard3, trainingYard1: TrainingYard
}
