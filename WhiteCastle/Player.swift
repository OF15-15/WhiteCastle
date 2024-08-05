//
//  Player.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import Foundation

class Player {
    var food = 0
    var iron = 0
    var pearls = 0
    
    var coins = 0
    var seals = 0
    var influence = 0
    
    var gardeners = 5
    var courtiers = 5
    var warriors = 5
    
    var points = 0
    
    func gainFood(_ amount: Int) -> Bool {
        if food + amount < 0 {
            return false
        }
        food += amount
        if food > 7 {
            food = 7
        }
        return true
    }
    func gainIron(_ amount: Int) -> Bool {
        if iron + amount < 0 {
            return false
        }
        iron += amount
        if iron > 7 {
            iron = 7
        }
        return true
    }
    func gainPearls(_ amount: Int) -> Bool {
        if pearls + amount < 0 {
            return false
        }
        pearls += amount
        if pearls > 7 {
            pearls = 7
        }
        return true
    }


    
}
