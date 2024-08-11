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
            ForEach(gameBoard.bridges, id: \.color) { bridge in
                BridgeDiceView(bridge: bridge)
            }
        }
    }
}

#Preview {
    var gb = GameBoard()
    DiceView(gameBoard: gb)
}
