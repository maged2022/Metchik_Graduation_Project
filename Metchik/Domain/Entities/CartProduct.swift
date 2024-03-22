//
//  CartProduct.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI

struct CartProduct: Hashable {
    let productID: String
    let size: ProductSizes
    let color: Color
    let selectedCount: Int
}
