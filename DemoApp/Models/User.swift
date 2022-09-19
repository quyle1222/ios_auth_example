//
//  User.swift
//  DemoApp
//
//  Created by TuPT on 19/09/2022.
//

import Foundation

struct User : Codable{
    var username:String
    var password:String
    
    enum CodingKeys: String, CodingKey {
        case username, password
    }
}
