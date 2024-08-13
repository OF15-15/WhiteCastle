//
//  WhiteCastleApp.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import SwiftUI

@main
struct WhiteCastleApp: App {
    var user = NetworkUser()
    
    var body: some Scene {
        WindowGroup {
            LoginView(user: user)
        }
    }
}
