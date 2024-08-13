//
//  PlayView.swift
//  WhiteCastle
//
//  Created by Ich on 07.08.24.
//

import SwiftUI

struct PlayView: View {
    var game: Game
    
    var body: some View {
        VStack {
            ResourceView(player: game.getPlayer())
            DiceView(gameBoard: game.board)
                .frame(height: UIScreen.main.bounds.width/7)
            
            ScrollView() {
                
            }
            
            // BottomView()
        }
    }
}

#Preview {
    Text("not implemented")
    //PlayView()
}
