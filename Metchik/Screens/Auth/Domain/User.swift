//
//  User.swift
//  Metchik
//
//  Created by Hassan on 07/05/2024.
//

import Foundation
struct User {
    let id, userName, email, password: String
    let role: String
    let avatar: String
    let imageURL: String
    let token: String
    let age: String
    static let mock: User = .init(
        id: "",
        userName: "guest",
        email: "guest@example.com",
        password: "guest123",
        role: "user",
        avatar: "test",
        imageURL: "https://res.cloudinary.com/daapjokhn/image/upload/v1715037331/urlyjh6zeogchyjacu0f.png",
        token: "guest token",
        age: "??"
        
    )
}
