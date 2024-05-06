//
//  ProductSource.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation

struct MetaProductSource: Codable {
    let status: String
    let data: DataProductSource
}

// MARK: - DataProductSource
struct DataProductSource: Codable {
    let products: [ProductSource]
}

// MARK: - ProductSource
struct ProductSource: Codable {
    let id, title: String
    let shortDescription: String
    let price: Double
//    let isFavorite: Bool
    let discountPrecentage: Double
    let category, subCategory: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, shortDescription, price, discountPrecentage, category, subCategory, imageUrl
    }
}
