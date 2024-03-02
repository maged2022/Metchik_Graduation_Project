//
//  ProductDetail.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Foundation
import SwiftUI

struct ProductDetail {
    let images: [String]// url(string: images)
    let rating: Double // 1 - 5
    let review: Int
    let productAttribute: [ProductAttribute]
    let description: String
    
    static let mockData:ProductDetail = ProductDetail(images: ["discount_image4"],
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
