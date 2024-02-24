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
    static let mockData: Product = Product(id: "1",
                                           name: "test",
                                           shortDescription: "shortDescription",
                                           price: 44,
                                           discountPercentage: 32,
                                           mainImage:  AssetImage.images.swiftUIImage ,
                                           category: "",
                                           subCategory: "")
    
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
                    mainImage: ImageAsset(name: source.mainImage).swiftUIImage,
                    category: source.category,
                    subCategory: source.subCategory
                )
            }
        }
}
