//
//  User.swift
//  InnovativeTask
//
//  Created by Muzamil Hassan on 25/01/2021.
//

import Foundation
struct User: Decodable {
    let token: String
    var userName: String
    var password: String
    enum CodingKeys: String, CodingKey {
        case token
        case userName
        case password
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decode(String.self, forKey: .token)
        userName = try values.decodeIfPresent(String.self, forKey: .userName) ?? String()
        password = try values.decodeIfPresent(String.self, forKey: .password) ?? String()
    }
    
    
}
struct Credentials {
    var username: String = ""
    var password: String = ""
}
