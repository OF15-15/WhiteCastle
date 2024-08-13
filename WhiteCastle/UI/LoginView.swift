//
//  LoginView.swift
//  WhiteCastle
//
//  Created by Ich on 05.08.24.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = "foo"
    @State var password: String = "bar"
    @State var info: String = ""
    @State var loginVisible: Bool = true
    var user: NetworkUser
    
    var body: some View {
        if loginVisible {
            VStack {
                Image("castle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(50)
                TextField("Username", text: $username)
                SecureField("Password", text: $password)
                Button(action: {
                    user.username = username
                    Task {
                        do {
                            let result = try await user.login()
                            if !result {
                                info = "Wrong username or password"
                            } else {
                                loginVisible = false
                            }
                        } catch let e as NetworkError {
                            info = e.rawValue
                        } catch {
                            info = "Error"
                        }
                    }
                }, label: {
                    Text("Login")
                }
                )
                Text(info)
            }
            .padding(20)
        }
        else {
            GamesView()
        }
    }
}

#Preview {
    LoginView(user: NetworkUser())
}
