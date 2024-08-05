//
//  Action.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import Foundation

class Action{
    let diceValue: DColor = DColor.red
    let diceColor: Int = 6
    let effect: (Player, GameBoard) -> Void = {_,_ in}
}
