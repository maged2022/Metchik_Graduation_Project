//
//  CartSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import Foundation
import Combine

protocol CartSourceRepositories {
    func getCartProducts()-> AnyPublisher<[CartProductSourceEntity], Never>
    func saveCartProductSource(_ cartProductSource: CartProductSourceEntity)
}

class CartSourceRepositoriesImpl: CartSourceRepositories {
    @Published var coreManager = CoreDataManager()
    @Published var cartProducts: [CartProductSourceEntity] = []
    
    init() {
        fetchCartProducts()
    }
    
    private func fetchCartProducts() {
        cartProducts = coreManager.cartProducts
    }
    
    func getCartProducts() -> AnyPublisher<[CartProductSourceEntity], Never> {
        $cartProducts.eraseToAnyPublisher()
    }
    
    func saveCartProductSource(_ cartProductSource: CartProductSourceEntity) {
        coreManager.addCartProduct(cartProduct: cartProductSource)
    }
}
