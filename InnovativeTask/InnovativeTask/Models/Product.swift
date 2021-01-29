//
//  Product.swift
//  InnovativeTask
//
//  Created by Muzamil Hassan on 24/01/2021.
//

import Foundation
struct Product: Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let itemRate: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case itemRate
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        price = try values.decode(Double.self, forKey: .price)
        itemRate = try values.decode(Int.self, forKey: .itemRate)
    }
    
    
}
struct ProductList: Decodable {
    let itemList: [Product]
    
    enum CodingKeys: String, CodingKey {
        case itemList
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        itemList = try values.decode([Product].self, forKey: .itemList)
    }
}
