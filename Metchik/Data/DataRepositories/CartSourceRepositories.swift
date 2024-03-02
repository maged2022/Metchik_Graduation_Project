//
//  CartSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import Foundation
import Combine

protocol CartSourceRepositories {
    func getCartProducts() -> AnyPublisher<[CartProductSource], Never>
    func saveCartProductSource(_ cartProductSource: CartProductSource)
    func deleteCartProductSource(indexSet: IndexSet)
}

class CartSourceRepositoriesImpl: CartSourceRepositories {
    @Published var coreManager = CoreDataManager()
    @Published var cartProducts: [CartProductSource] = []
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchCartProducts()
    }
    
    private func fetchCartProducts() {
        coreManager.$cartProducts.sink { [weak self] cartProducts in
            self?.cartProducts = cartProducts
        }.store(in: &cancellables)
    }
    
    func getCartProducts() -> AnyPublisher<[CartProductSource], Never> {
        $cartProducts.eraseToAnyPublisher()
    }
    
    func saveCartProductSource(_ cartProductSource: CartProductSource) {
        coreManager.addCartProduct(cartProduct: cartProductSource)
    }
    
    func deleteCartProductSource(indexSet: IndexSet) {
        coreManager.deleteCartProduct(indexSet: indexSet)
    }
}
