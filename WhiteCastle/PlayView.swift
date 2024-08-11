//
//  PlayView.swift
//  WhiteCastle
//
//  Created by Ich on 07.08.24.
//

import SwiftUI

struct PlayView: View {
    var gameBoard = GameBoard()

    var body: some View {
        var player = gameBoard.players[0]
        VStack {
            ResourceView(player: player)
            DiceView(gameBoard: gameBoard)
                .frame(height: UIScreen.main.bounds.width/7)
            
            ScrollView() {
                
            }
            
            // BottomView()
        }
    }
}

#Preview {
    PlayView()
}
