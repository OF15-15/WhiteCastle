//
//  PlayerTests.swift
//  WhiteCastleTests
//
//  Created by Ich on 05.08.24.
//

import Testing
@testable import WhiteCastle

struct PlayerTests {

    @Suite struct RessourceTests {
        
        @Test func testUpperLimits() {
            let p = Player()
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
            let p = Player()
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
            let p = Player()
            
            #expect(p.gainInfluence(7))
            #expect(p.influence == 5)
            _ = p.gainSeals(2)
            _ = p.gainInfluence(4)
            #expect(p.influence == 9)
            #expect(p.seals == 1)
            
            _ = p.gainInfluence(9)
            #expect(p.influence == 10)
            _ = p.gainSeals(5)
            _ = p.gainInfluence(200)
            
            #expect(p.seals == 0)
            #expect(p.influence == 20)
        }
        
          
    }
}
