//
//  Components.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

struct Components {
    let startResourceCards = [ // should be 9 in total
        StartResourceCard(lanternResource: .iron, food: 0, iron: 0, pearls: 0, coins: 4, seals: 1, any: 3, decree: 0),
        StartResourceCard(lanternResource: .iron, food: 1, iron: 2, pearls: 1, coins: 3, seals: 1, any: 0, decree: 0),
        StartResourceCard(lanternResource: .iron, food: 0, iron: 1, pearls: 2, coins: 4, seals: 0, any: 0, decree: 2),
        StartResourceCard(lanternResource: .pearls, food: 0, iron: 2, pearls: 1, coins: 5, seals: 1, any: 0, decree: 0),
        StartResourceCard(lanternResource: .pearls, food: 0, iron: 0, pearls: 0, coins: 4, seals: 2, any: 2, decree: 0),
        StartResourceCard(lanternResource: .pearls, food: 2, iron: 1, pearls: 0, coins: 2, seals: 1, any: 0, decree: 1),
        StartResourceCard(lanternResource: .food, food: 2, iron: 2, pearls: 1, coins: 4, seals: 1, any: 0, decree: 0),
        StartResourceCard(lanternResource: .food, food: 4, iron: 2, pearls: 0, coins: 3, seals: 2, any: 0, decree: 0),
        StartResourceCard(lanternResource: .food, food: 0, iron: 0, pearls: 0, coins: 2, seals: 2, any: 1, decree: 3)
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
    
    let diplomatCards = [ // 12 in total
        DiplomatCard(top: YardAction(), bottom: GainAction(.any, 3), bottomTwo: true),
        DiplomatCard(top: TwoAction(GainAction(.influence, 1), LanternAction()), bottom: GardenAction(), bottomTwo: false)
    ]
    
    let diceTiles = [
        DiceTile(.red, .food),
        DiceTile(.red, .iron),
        DiceTile(.red, .pearls),
        DiceTile(.red, .any),
        DiceTile(.red, .coins),
        DiceTile(.black, .food),
        DiceTile(.black, .iron),
        DiceTile(.black, .pearls),
        DiceTile(.black, .any),
        DiceTile(.black, .coins),
        DiceTile(.white, .food),
        DiceTile(.white, .iron),
        DiceTile(.white, .pearls),
        DiceTile(.white, .any),
        DiceTile(.white, .coins)
    ]
    
    let yardTiles: [YardTile] = [ // 8 in total, not correct!!!!
        YardTile(blue: CastleAction(), yellow: GainAction(.influence, 2)),
        YardTile(blue: GardenAction(), yellow: GainAction(.points, 2)),
        YardTile(blue: YardAction(), yellow: LanternAction()),
        YardTile(blue: CastleAction(), yellow: WellAction())
    ]
}
