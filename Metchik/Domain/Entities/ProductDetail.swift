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
    
    static let mockData:ProductDetail = ProductDetail(images: [URL(string:" https://res.cloudinary.com/duwfy7ale/image/upload/v1714400077/hwm087lyxwvzccfrfoh1.webp")],
                                                      rating: 4,
                                                      review: 33,
                                                      productAttribute: [
                                                        .init(
                                                            sizes: .m,
                                                            avaliableInStok: [22],
                                                            colors: [.blue])],
                                                      description: "srfsdf")
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
