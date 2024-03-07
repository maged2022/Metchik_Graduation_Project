//
//  CartUseCase.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI
import Combine

class CartUseCase: CartRepositories {
    @Published private var cartRepo: CartSourceRepositories = CartSourceRepositoriesImpl()
    @Published private var cartProducts: [CartProduct] = []
    private var cancellables = Set<AnyCancellable>()
    static var instance = CartUseCase()
    private init() {
        fetchCartProduct()
    }
    
    func fetchCartProduct () {
        cartRepo.getCartProducts()
            .map {$0.map {$0.toCartProduct()}}
            .sink {[weak self] products in
            self?.cartProducts = products
        }
            .store(in: &cancellables)
    }
    
    func getCartProducts() -> AnyPublisher<[CartProduct], Never> {
        $cartProducts.eraseToAnyPublisher()
    }
    
    func saveCartProduct(product: Product, size: ProductSizes, color: Color, count: Int) {
        let cartProduct = CartProduct(productID: product.id, size: size, color: color, selectedCount: count)
        cartRepo.saveCartProductSource(cartProduct.toCartProductSource())
    } 
    
    func deleteCartProduct(indexSet: IndexSet) {
        cartRepo.deleteCartProductSource(indexSet: indexSet)
    }
    
    func getCartProductsCount() -> AnyPublisher<Int, Never> {
        $cartProducts.map {$0.count}.eraseToAnyPublisher()
    }
}
