//
//  Product.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let price: Double
    let discountPrice: Double 
}
