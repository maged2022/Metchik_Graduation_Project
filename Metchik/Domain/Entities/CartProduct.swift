//
//  CartProduct.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI

struct CartProduct: Identifiable {
    let productID: String
    let size: ProductSizes
    let color: Color
    let selectedCount: Int
    var id: String {
        productID + size.rawValue + color.toString()
    }
}
