//
//  PlayerTests.swift
//  WhiteCastleTests
//
//  Created by Ich on 05.08.24.
//

import Testing
@testable import WhiteCastle

struct PlayerTests {
    
    @Suite struct ResourceTests {
        let standardStartResourceCard = StartResourceCard()
        let standardStartActionCard = StartActionCard(action: Action())
        
        @Test func testUpperLimits() {
            let p = Player(startResourceCard: standardStartResourceCard, startActionCard: standardStartActionCard)
            #expect(p.gainIron(2))
            #expect(p.iron == 2)
            #expect(p.gainPearls(0))
            #expect(p.pearls == 0)
            #expect(p.gainFood(100))
            #expect(p.food == 7)
            
            #expect(p.gainSeals(6))
            #expect(p.seals == 5)
        }
        
        @Test func testLowerLimits() {
            let p = Player(startResourceCard: standardStartResourceCard, startActionCard: standardStartActionCard)
            #expect(p.gainFood(1))
            #expect(!p.gainFood(-2))
            #expect(p.food == 1)
            
            #expect(!p.gainIron(-100))
            #expect(p.iron == 0)
            
            #expect(p.gainPearls(100))
            #expect(!p.gainPearls(-8))
            #expect(p.pearls == 7)
            
            #expect(!p.gainSeals(-1))
            #expect(!p.gainCoins(-1))
        }
        
        @Test func testInfluence() {
            let p = Player(startResourceCard: standardStartResourceCard, startActionCard: standardStartActionCard)
            
            #expect(p.gainInfluence(7))
            #expect(p.influence == 5)
            p.gainSeals(2)
            p.gainInfluence(4)
            #expect(p.influence == 9)
            #expect(p.seals == 1)
            
            p.gainInfluence(9)
            #expect(p.influence == 10)
            p.gainSeals(5)
            p.gainInfluence(200)
            
            #expect(p.seals == 0)
            #expect(p.influence == 20)
        }
    }
    
    @Suite struct StartResourceTests {
        @Test func standardStartResourceCard() {
            let src = StartResourceCard(lanternResource: .food, food: 2, iron: 1, pearls: 3, coins: 2, seals: 1, any: 0, decree: 0)
            let sac = StartActionCard(action: Action())
            let p = Player(startResourceCard: src, startActionCard: sac)
            #expect(p.food == 2)
            #expect(p.iron == 1)
            #expect(p.pearls == 3)
            #expect(p.coins == 2)
            #expect(p.seals == 1)
            
            #expect(p.lanternCards[0] === src)
            p.lantern.run(player: p)
            #expect(p.food == 3)
        }
    }
}
