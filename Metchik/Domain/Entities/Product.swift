//
//  Product.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct Product: Identifiable {
    let id: String
    let name: String
    let shortDescription: String
    let price: Double
    let discountPercentage: Double
//    let isFavorite: Bool
    let mainImage: Image
    let category: String
    let subCategory: String

}

extension ProductSource {
    func toProduct() -> Product {
        Product(id: self.id,
                name: self.name,
                shortDescription: self.shortDescription,
                price: self.price,
                discountPercentage: self.discountPercentage,
//                isFavorite: self.isFavorite,
                mainImage: ImageAsset(name: self.mainImage).swiftUIImage ,
                category: self.category,
                subCategory: self.subCategory)
    }
}

struct ProductDetail {
    let images: [String]// url(string: images)
    let rating: Double // 1 - 5
    let review: Int
    let productAttribute: [ProductAttribute]
    let description: String
}

struct ProductAttribute {
    let sizes: ProductSizes
    let avaliableInStok: [Int]
    let colors: [String]
}

enum ProductSizes {
    case s
    case m
    case l
    case xl
    case xxl
}
