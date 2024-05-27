//
//  ProductSourceDetail.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Foundation
// MARK: - MetaProductSourceDetail
struct MetaProductSourceDetail: Codable {
    let status: String
    let data: DataProductSourceDetail
}

// MARK: - DataClassProductSourceDetail
struct DataProductSourceDetail: Codable {
    let productContain: [ProductSourceDetail]
}

struct ProductSourceDetail : Codable {
    let imageUrl: [String]
    let rating: Double
    let review: Int
    let productAttribute: [ProductSourceAttribute]
    let description: String
    let machineImage: String

}

struct ProductSourceAttribute: Codable {
    let sizes: String
    let availableInStock: [Int]
    let colors: [String]
}
