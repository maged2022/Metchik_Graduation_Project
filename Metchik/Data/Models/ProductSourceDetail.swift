//
//  ProductSourceDetail.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Foundation

struct ProductSourceDetail : Codable {
    let images: [String]// url(string: images)
    let rating: Double // 1 - 5
    let review: Int
    let productAttribute: [ProductSourceAttribute]
    let description: String
    
    static let mockData:ProductSourceDetail = ProductSourceDetail(images: ["discount_image4"],
                                                      rating: 4,
                                                      review: 33,
                                                      productAttribute: [
                                                        .init(
                                                            sizes: .m,
                                                            avaliableInStok: [22],
                                                            colors: ["white"])],
                                                      description: "srfsdf")
}

struct ProductSourceAttribute: Codable {
    let sizes: ProductSourceSizes
    let avaliableInStok: [Int]
    let colors: [String]
}

enum ProductSourceSizes:String, Codable {
    case s
    case m
    case l
    case xl
    case xxl
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = ProductSourceSizes(rawValue: rawValue) ?? .m
    }
}
