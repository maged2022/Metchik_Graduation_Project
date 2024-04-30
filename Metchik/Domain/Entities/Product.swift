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
    let discountPrecentage: Double
//    let isFavorite: Bool
    let imageURL: URL?
    let category: String
    let subCategory: String
    static let mockData: Product = Product(
        id: "1",
        name: "test",
        shortDescription: "shortDescription",
        price: 44.7,
        discountPrecentage: 32,
        imageURL: URL(
            string: "https://shopgroove.pk/cdn/shop/products/S01e7c5c3f5bf4632b8e94d2d73cd6f6e5_jpg_640x640Q90_jpg.jpg"
        )  ,
        category: "",
        subCategory: ""
    )
    
}
