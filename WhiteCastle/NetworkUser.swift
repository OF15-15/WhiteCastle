//
//  NetworkUser.swift
//  WhiteCastle
//
//  Created by Ich on 13.08.24.
//

import Foundation

enum httpsType: String {
    case GET
    case POST
}

enum NetworkError: String, Error {
    case connectionError
    case loginError
    case dataError
    case httpsError
}

class NetworkUser: Codable {
    var username: String = ""
    var loggedIn: Bool = false
    
    func apiCall(to endpoint: String, type: httpsType, data: Codable? = nil) async throws -> (Data, HTTPURLResponse) {
        let url = URL(string: "https://wc.of15-15.de\(endpoint)")!
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if type == .POST {
            if data == nil {
                throw NetworkError.dataError
            }
            let rawData = try? JSONEncoder().encode(data!)
            if rawData == nil {
                throw NetworkError.dataError
            }
            request.httpBody = rawData
        }
        let ret = try? await URLSession.shared.data(for: request)
        if ret == nil {
            throw NetworkError.connectionError
        }
        return (ret!.0, ret!.1 as! HTTPURLResponse)
    }
    
    
    func login() async throws -> Bool {
        struct User: Codable {
            let username: String
        }
        let (data, resp) = try await apiCall(to: "/login", type: .POST, data: User(username: username))//, password: password))
        if resp.statusCode != 200 {
            throw NetworkError.httpsError
        }
        loggedIn = data.base64EncodedString() == "eyJyZXN1bHQiOiJzdWNjZXNzIn0="
        return loggedIn
        
    }
    
    func newGame(_ game: Game) throws {
        //try JSONEncoder().encode(game)
        

        let rawData: Action = GainAction(.food, 2)
        if let jsonData = try? JSONEncoder().encode(rawData),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        }

    }
    
}
