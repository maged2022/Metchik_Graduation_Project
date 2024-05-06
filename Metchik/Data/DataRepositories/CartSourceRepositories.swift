//
//  CartSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import Foundation
import Combine

protocol CartSourceRepositories {
    func getCartProducts(completion: @escaping ([CartProductSource]) -> Void)
    func saveCartProductSource(_ cartProductSource: CartProductSource)
    func deleteCartProductSource(indexSet: IndexSet)
    func updateCartProductSource(for cartProductSource: CartProductSource ,with count: Int)
}

class CartSourceRepositoriesImpl: CartSourceRepositories {
    @Published var coreManager = CoreDataManager()
    private var cancellables = Set<AnyCancellable>()

    func getCartProducts(completion: @escaping ([CartProductSource]) -> Void) {
        coreManager.$cartProducts.sink { cartProducts in
            completion(cartProducts)
        }.store(in: &cancellables)
    }
    
    func saveCartProductSource(_ cartProductSource: CartProductSource) {
        coreManager.addCartProduct(cartProduct: cartProductSource)
    }
    
    func updateCartProductSource(for cartProductSource: CartProductSource ,with count: Int) {
        coreManager.updateCartProduct(for: cartProductSource, with: count)
    }
    
    func deleteCartProductSource(indexSet: IndexSet) {
        coreManager.deleteCartProduct(indexSet: indexSet)
    }
}
