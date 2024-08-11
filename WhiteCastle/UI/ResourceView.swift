//
//  ResourceView.swift
//  WhiteCastle
//
//  Created by Ich on 07.08.24.
//

import SwiftUI

struct ResourceView: View {
    var player: Player
    
    var body: some View {
        HStack {
            VStack {
                Image("food")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(String(player.food))
                    .font(.largeTitle)
            }
            VStack {
                Image("iron")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(String(player.iron))
                    .font(.largeTitle)
            }
            VStack {
                Image("pearls")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(String(player.pearls))
                    .font(.largeTitle)
            }
            VStack {
                Image("coins")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(String(player.coins))
                    .font(.largeTitle)
            }
            VStack {
                Image("seals")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(String(player.seals))
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}

#Preview {
    let gb = GameBoard()
    let p = gb.players[0]
    ResourceView(player: p)
}
