//
//  SubCategory.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

struct SubCategory: Identifiable {
    let id: UUID = UUID()
    let name: String
    let products: [Product] = [Product(id: "00", name: "test", images: ["error"], price: 66.6, discountPrice: 554.4)]
}
