//
//  Auth.swift
//  DemoApp
//
//  Created by TuPT on 19/09/2022.
//

import Foundation
struct AuthResponse: Codable {
    var success : Bool
    var message: String?
    var error: String?
    var data : AuthData?
    enum CodingKeys: String, CodingKey {
        case success, message, error, data
    }
}

struct AuthData:Codable {
    var token:String?
    var userId:Int?
    enum CodingKeys: String, CodingKey {
        case token, userId
    }
}
