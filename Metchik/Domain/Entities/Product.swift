//
//  Product.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct Product: Identifiable {
    let id: String
    let name: String
    let shortDescription: String
    let price: Double
    let discountPrecentage: Double
//    let isFavorite: Bool
    let imageURL: URL?
    let category: String
    let subCategory: String
    static let mockData: Product = Product(id: "1",
                                           name: "test",
                                           shortDescription: "shortDescription",
                                           price: 44.7,
                                           discountPrecentage: 32,
                                           imageURL: URL(string: "https://res.cloudinary.com/duwfy7ale/image/upload/v1714353252/owzrmpeqc1qj7rkydvrn.jpg")  ,
                                           category: "",
                                           subCategory: "")
    
}
