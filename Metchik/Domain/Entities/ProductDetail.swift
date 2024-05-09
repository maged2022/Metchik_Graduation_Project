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
                    "https://us.123rf.com/450wm/serezniy/serezniy1809/serezniy180917794/108061719-blank-white-t-shirt-against-brick-wall.jpg?ver=6"
            ),
            URL(
                string:
                    "https://us.123rf.com/450wm/shubhamo0o/shubhamo0o2310/shubhamo0o231004262/216540043-blank-white-t-shirt-isolated-on-gray-background-3-d-renderingblank-white-t-shirt-isolated-on-gray.jpg?ver=6"
            ),
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
