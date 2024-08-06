//
//  WhiteCastleTests.swift
//  WhiteCastleTests
//
//  Created by Ich on 05.08.24.
//

import Testing
@testable import WhiteCastle

struct WhiteCastleTests {
    
    @Test func testLanternCards() {
        
        let src = StartResourceCard(lanternResource: .food, food: 2, iron: 1, pearls: 3, coins: 2, seals: 1)
        let sac = StartActionCard(action: Action())
        let p = Player(startResourceCard: src, startActionCard: sac)
        
        #expect(p.lanternCards[0] === src)
        p.lantern.run(player: p)
        #expect(p.food == 3)
                
        p.gainActionCard(FirstLevelCard(top: Action(), middle: Action(), bottom: Action()))
        p.lantern.run(player: p)
        #expect(p.food == 4)
        #expect(p.influence == 1)
        
        p.gainActionCard(SecondLevelCard(top: Action(), middle: Action(), bottom: Action()))
        p.lantern.run(player: p)
        #expect(p.food == 5)
        #expect(p.influence == 2)
        #expect(p.coins == 3)
        
        p.gainActionCard(SecondLevelCard(top: Action(), middle: Action(), bottom: Action()))
        p.lantern.run(player: p)
        #expect(p.food == 6)
        #expect(p.influence == 3)
        #expect(p.coins == 4)
        #expect(p.points == 1)
        
        
    }
}
