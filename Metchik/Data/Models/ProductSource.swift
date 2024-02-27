//
//  ProductSource.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation

struct ProductSource: Identifiable, Codable {
    let id: String
    let name: String
    let shortDescription: String
    let price: Double
    let discountPercentage: Double
//    let isFavorite: Bool
    let mainImage: String
    let category: String
    let subCategory: String
    
}
