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
    
    func gainResources(type: Ressource, amount: Int) -> Bool {
        switch type {
        case .food: return gainFood(amount)
        case .iron: return gainIron(amount)
        case .pearls:  return gainPearls(amount)
        }
    }
    
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
    
    func gainCoins(_ amount: Int) -> Bool {
        if coins + amount < 0 {
            return false
        }
        coins += amount
        return true
    }
    func gainSeals(_ amount: Int) -> Bool {
        if seals + amount < 0 {
            return false
        }
        seals += amount
        if seals > 5 {
            seals = 5
        }
        return true
    }
    func gainInfluence(_ amount: Int) -> Bool {
        // TBD: Implement choice to not pay seals
        if influence <= 5 && influence + amount >= 6 {
            if !gainSeals(-1) {
                influence = 5
                return true
            }
        }
        if influence <= 10 && influence + amount >= 11 {
            if !gainSeals(-2) {
                influence = 10
                return true
            }
        }
        if influence <= 14 && influence + amount >= 15 {
            if !gainSeals(-3) {
                 influence = 14
                return true
            }
        }
        influence += amount
        if influence > 20 {
            influence = 20
        }
        return true
    }
    
}
