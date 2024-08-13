//
//  GamesView.swift
//  WhiteCastle
//
//  Created by Ich on 13.08.24.
//

import SwiftUI

struct GamesView: View {
    var openGames: [Game] = []
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Home View")
                    ForEach(openGames, id: \.id) { game in
                        NavigationLink(destination: PlayView(game: game)) {
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GamesView()
}
