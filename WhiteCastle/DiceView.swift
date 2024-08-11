//
//  DiceView.swift
//  WhiteCastle
//
//  Created by Ich on 09.08.24.
//

import SwiftUI


struct DiceView: View {
    var gameBoard: GameBoard
    
    var body: some View {
        HStack {
            ForEach(gameBoard.blackBridge.dices) { dice in
                SingleDiceView(dice: dice)
            }
        }
    }
}

#Preview {
    var gb = GameBoard()
    DiceView(gameBoard: gb)
}
