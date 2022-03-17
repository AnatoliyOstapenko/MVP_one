//
//  FakeAPI.swift
//  MVP_one
//
//  Created by AnatoliiOstapenko on 16.03.2022.
//

import Foundation

struct FakeAPI: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case postId, id, name, email
        case text = "body"
    }
    
}
