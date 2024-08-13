//
//  GamesView.swift
//  WhiteCastle
//
//  Created by Ich on 13.08.24.
//

import SwiftUI

struct GamesView: View {
    @State var openGames: [Game] = []
    var user: NetworkUser
    @State var info = ""
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    VStack {
                        Text("open Games")
                        ForEach(openGames, id: \.id) { game in
                            NavigationLink(destination: PlayView(game: game)) {
                            }
                        }
                    }
                }
            }
        }
        
        Spacer()
        Button(action: {
            Task {
                let newGame = Game()
                do {
                    try await user.newGame(newGame)
                    openGames.append(newGame)
                    info = ""
                } catch let e as NetworkError{
                    print(e)
                    info = e.rawValue
                } catch {
                    print(error)
                    info = "error"
                }
            
            }
            
        }, label: {Text("new Game")})
        Text(info)
    }
}

#Preview {
    GamesView(user: NetworkUser())
}
