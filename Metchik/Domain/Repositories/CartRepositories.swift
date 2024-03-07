//
//  CartRepositories.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI
import Combine

protocol CartRepositories {
    func saveCartProduct(product: Product, size: ProductSizes, color: Color, count: Int )
    func getCartProducts() -> AnyPublisher<[CartProduct], Never>
    func deleteCartProduct(indexSet: IndexSet)
    func getCartProductsCount() -> AnyPublisher<Int, Never>
}
