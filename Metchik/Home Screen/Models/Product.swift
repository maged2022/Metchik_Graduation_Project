//
//  Product.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id: String
    let name: String
    let imageName: String
    let price: Double
    let discountPrice: Double
}
