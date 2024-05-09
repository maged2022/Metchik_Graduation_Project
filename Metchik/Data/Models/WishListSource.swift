//
//  WishListSource.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import Foundation

// MARK: - MetaWishListSource
struct MetaWishListSource: Codable {
    let status: String
    let data: DataWishListSource
}

// MARK: - DataWishListSource
struct DataWishListSource: Codable {
    let userFavorites: [WishListSource]
}

// MARK: - UserFavorite
struct WishListSource: Codable {
    let id: String
    let productID: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productID = "productId"
    }
}

struct Status: Codable {
    let status, message: String
}
