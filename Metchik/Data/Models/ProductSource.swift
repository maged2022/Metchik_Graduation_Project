//
//  ProductSource.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation

struct ProductSource: Identifiable, Codable {
    let id: String
    let name: String
    let shortDescription: String
    let price: Double
    let discountPercentage: Double
    let isFavorite: Bool
    let mainImage: String
    let category: String
    let subCategory: String
    
}

struct ProductSourceDetail : Codable {
    let images: [String]// url(string: images)
    let rating: Double // 1 - 5
    let review: Int
    let productAttribute: [ProductSourceSizes]
    let description: String
}

struct ProductSourceAttribute: Codable {
    let sizes: ProductSourceSizes
    let avaliableInStok: [Int]
    let colors: [String]
}

enum ProductSourceSizes: Codable {
    case s
    case m
    case l
    case xl
    case xxl
}
