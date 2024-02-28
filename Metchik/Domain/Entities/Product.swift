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
    let discountPercentage: Double
//    let isFavorite: Bool
    let mainImage: Image
    let category: String
    let subCategory: String
    static let mockData: Product = Product(id: "1",
                                           name: "test",
                                           shortDescription: "shortDescription",
                                           price: 44.7,
                                           discountPercentage: 32,
                                           mainImage:  AssetImage.discountImage2.swiftUIImage ,
                                           category: "",
                                           subCategory: "")
    
}
