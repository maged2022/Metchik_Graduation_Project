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
//    let category: Category
//    let subCategory: SubCategory
    let images: [String]// url(string: images)
    let isFavorite: Bool
    let rating: Double // 1 - 5
    let review: Int
    let productAttribute: [ProductSourceAttribute]
    let description: String
    let price: Double
    let discountPrice: Double
    init(id: String, name: String, shortDescription: String = "shortDescription", images: [String], isFavorite: Bool = true, rating: Double = 1.1, review: Int = 50,
         productAttribute: [ProductSourceAttribute] = [ProductSourceAttribute(sizes: .m,
                                                                  avaliableInStok: [1,2], colors: ["red","blue"])],
         description: String = "long description", price: Double, discountPrice: Double) {
        self.id = id
        self.name = name
        self.shortDescription = shortDescription
        self.images = images
        self.isFavorite = isFavorite
        self.rating = rating
        self.review = review
        self.productAttribute = productAttribute
        self.description = description
        self.price = price
        self.discountPrice = discountPrice
    }
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
