//
//  Discount.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

struct Discount: Identifiable {
    let id: UUID = UUID()
    let imageName: String
    let oldPrice: Double
    let newPrice: Double
}
