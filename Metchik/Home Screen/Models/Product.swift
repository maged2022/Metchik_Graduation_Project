//
//  Product.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: String
    let name: String
    let shortDescription: String
//    let category: Category
//    let subCategory: SubCategory
    let images: [String]// url(string: images)
    let isFavorite: Bool
    let rating: Double // 1 - 5
    let review: Int
    let productAttribute: [ProductAttribute]
    let description: String
    let price: Double
    let discountPrice: Double
    init(id: String, name: String, shortDescription: String = "shortDescription", images: [String], isFavorite: Bool = true, rating: Double = 1.1, review: Int = 50, productAttribute: [ProductAttribute] = [ProductAttribute(sizes: .m, avaliableInStok: [1,2], colors: ["red","blue"])], description: String = "long description", price: Double, discountPrice: Double) {
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

struct ProductAttribute: Codable {
    let sizes: ProductSizes
    let avaliableInStok: [Int]
    let colors: [String]
}

enum ProductSizes: Codable {
    case s
    case m
    case l
    case xl
    case xxl
}
