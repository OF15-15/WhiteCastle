//
//  ResourceView.swift
//  WhiteCastle
//
//  Created by Ich on 07.08.24.
//

import SwiftUI

struct ResourceView: View {
    var body: some View {
        let gb = GameBoard()
        let p = gb.players[0]
        HStack {
            VStack {
                Image("food")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(String(p.food))
                    .font(.largeTitle)
            }
            VStack {
                Image("iron")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(String(p.iron))
                    .font(.largeTitle)
            }
            VStack {
                Image("pearls")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(String(p.pearls))
                    .font(.largeTitle)
            }
            VStack {
                Image("coins")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(String(p.coins))
                    .font(.largeTitle)
            }
            VStack {
                Image("seals")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(String(p.seals))
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}

#Preview {
    ResourceView()
}
