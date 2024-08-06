//
//  Player.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import Foundation

class Player {
    var food, iron, pearls: Int
    var coins, seals, influence: Int
    var gardeners, courtiers, warriors: Int
    var points: Int

    var lantern: LanternAction
    var lanternCards: [Card]
    var actionCard: Card
    
    init(startResourceCard: StartResourceCard, startActionCard: StartActionCard) {
        food = startResourceCard.food
        iron = startResourceCard.iron
        pearls = startResourceCard.pearls
        coins = startResourceCard.coins
        seals = startResourceCard.seals
        influence = 0
        gardeners = 5; courtiers = 5; warriors = 5
        points = 0
        
        lantern = LanternAction()
        lanternCards = [startResourceCard]
        actionCard = startActionCard
    }
    
    
    
    @discardableResult func gainResources(type: Resource, amount: Int) -> Bool {
        switch type {
        case .food: return gainFood(amount)
        case .iron: return gainIron(amount)
        case .pearls:  return gainPearls(amount)
        }
    }
    
    @discardableResult func gainFood(_ amount: Int) -> Bool {
        if food + amount < 0 {
            return false
        }
        food += amount
        if food > 7 {
            food = 7
        }
        return true
    }
    @discardableResult func gainIron(_ amount: Int) -> Bool {
        if iron + amount < 0 {
            return false
        }
        iron += amount
        if iron > 7 {
            iron = 7
        }
        return true
    }
    @discardableResult func gainPearls(_ amount: Int) -> Bool {
        if pearls + amount < 0 {
            return false
        }
        pearls += amount
        if pearls > 7 {
            pearls = 7
        }
        return true
    }
    
    @discardableResult func gainCoins(_ amount: Int) -> Bool {
        if coins + amount < 0 {
            return false
        }
        coins += amount
        return true
    }
    @discardableResult func gainSeals(_ amount: Int) -> Bool {
        if seals + amount < 0 {
            return false
        }
        seals += amount
        if seals > 5 {
            seals = 5
        }
        return true
    }
    @discardableResult func gainInfluence(_ amount: Int) -> Bool {
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
    
    @discardableResult func gainPoints(_ amount: Int) -> Bool {
        self.points += amount
        return true
    }
    
    
    func gainActionCard(_ card: Card) {
        lanternCards.append(actionCard)
        actionCard = card
    }
}
