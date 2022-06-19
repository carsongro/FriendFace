//
//  User.swift
//  FriendFace
//
//  Created by Carson Gross on 6/18/22.
//

import Foundation

struct User: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}
