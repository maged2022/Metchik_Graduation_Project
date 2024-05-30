//
//  UserSource.swift
//  Metchik
//
//  Created by Hassan on 07/05/2024.
//

import Foundation
// MARK: - MetaUserSource
struct MetaUserSource: Codable {
    let status: String
    let data: DataUserSource
}

// MARK: - DataClass
struct DataUserSource: Codable {
    let user: UserSource
}

// MARK: - UserSource
struct UserSource: Codable {
    let id, userName, email, password: String
    let role: String
    let avatar: String
    let imageURL: String
    let token: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userName, email, password, role, avatar
        case imageURL = "imageUrl"
        case token
    }
}
