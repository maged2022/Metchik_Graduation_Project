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
    func getCartProducts(completion: @escaping ([CartProduct]) -> Void)
    func deleteCartProduct(index: Int)
    func updateCartProduct(for cartProduct: CartProduct,with count: Int)
    func getCartProductsCount(completion: @escaping (Int) -> Void)
    func deleteAllCartProduct(completion: @escaping () -> Void)
}
