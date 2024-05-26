//
//  ProductDetail.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Foundation
import SwiftUI

struct ProductDetail {
    let images: [URL?]
    let rating: Double
    let review: Int
    let productAttribute: [ProductAttribute]
    let description: String
    
    static let mockData:ProductDetail = ProductDetail(
        images: [
            URL(
                string:
                    "https://i.pinimg.com/474x/f7/d6/16/f7d6164f24b5d0d99a6a2a1937a188ef.jpg"
            )
        ],
        rating: 4,
        review: 33,
        productAttribute: [
            .init(
                sizes: .m,
                avaliableInStok: [22],
                colors: [.white, .gray, .black, .red, .blue, .yellow, .green])],
        description: """
Our Classic Cotton Crewneck T-shirt offers timeless style and comfort. Made from
 premium 100% cotton, it features a relaxed fit and classic crewneck design.
 Available in various colors, it's perfect for any occasion.
 Upgrade your wardrobe with this versatile essential today!
"""
    )
}

struct ProductAttribute {
    let sizes: ProductSizes
    let avaliableInStok: [Int]
    let colors: [Color]
}

enum ProductSizes: String, CaseIterable {
    case s
    case m
    case l
    case xl
    case xxl
}
