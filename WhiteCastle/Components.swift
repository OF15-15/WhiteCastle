//
//  Components.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

struct ActionCards {
    let startResourceCards = [ // should be 9 in total
        StartResourceCard(lanternResource: .iron, food: 0, iron: 1, pearls: 2, coins: 4, seals: 0), // extra card though
        StartResourceCard(lanternResource: .food, food: 4, iron: 2, pearls: 0, coins: 3, seals: 2),
        StartResourceCard(lanternResource: .pearls, food: 2, iron: 0, pearls:0, coins: 4, seals: 2), // 2 food should be any resources
        StartResourceCard(lanternResource: .food, food: 1, iron: 0, pearls: 0, coins: 2, seals: 2) // extra card & food should be any
    ]
    
    let startActionCards = [ // 6 in total
        StartActionCard(action: Action()), // garden
        StartActionCard(action: Action()), // garden
        StartActionCard(action: Action()), // castle
        StartActionCard(action: Action()), // castle
        StartActionCard(action: Action()), // yard
        StartActionCard(action: Action()) // yard
    ]
    
    let stewardCards = [ // 15 in total
        StewardCard(top: TwoAction(GainAction(.seals, -1), YardAction()),
                    middle: TwoAction(GainAction(.food, 1), GainAction(.pearls, 1)),
                    bottom: TwoAction(GainAction(.iron, 1), LanternAction())),
        StewardCard(top: GainAction(.points, 2),
                    middle: TwoAction(GainAction(.seals, 1), GainAction(.any, 1)),
                    bottom: TwoAction(GainAction(.seals, -1), YardAction())),
        StewardCard(top: TwoAction(GainAction(.seals, -1), CastleAction()),
                    middle: GainAction(.influence, 1),
                    bottom: GainAction(.iron, 2))
    ]
}
