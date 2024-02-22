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

extension Array where Element == ProductSource {
    
    func toProducts() -> [Product] {
            return self.map { source in
                Product(
                    id: source.id, // Replace with the actual id property of ProductSource
                    name: source.name,
                    shortDescription: source.shortDescription,
                    price: source.price,
                    discountPercentage: source.discountPercentage,
//                    isFavorite: source.isFavorite, // Assuming isFavorite is a property of ProductSource
                    mainImage: ImageAsset(name: source.mainImage).swiftUIImage, // Update based on ImageAsset initialization
                    category: source.category,
                    subCategory: source.subCategory
                )
            }
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
