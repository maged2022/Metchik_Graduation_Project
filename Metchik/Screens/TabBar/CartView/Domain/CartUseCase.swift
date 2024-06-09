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
    
    private func fetchCartProduct () {
        cartRepo.getCartProducts {[weak self] products in
            self?.cartProducts = products.map {$0.toCartProduct()}
        }
    }
    
    func getCartProducts(completion: @escaping ([CartProduct]) -> Void) {
        $cartProducts.sink { cartProducts in
            completion(cartProducts)
        }.store(in: &cancellables)
    }
    
    func saveCartProduct(product: Product, size: ProductSizes, color: Color, count: Int) {
        let cartProduct = CartProduct(productID: product.id, size: size, color: color, selectedCount: count)
        cartRepo.saveCartProductSource(cartProduct.toCartProductSource())
    } 
    
    func checkSelectedCartProduct(product: Product, size: ProductSizes, color: Color) -> Bool {
        let cartProduct = CartProduct(productID: product.id, size: size, color: color, selectedCount: 1)
        return cartRepo.checkSelectedCartProductSource(cartProduct.toCartProductSource())
    }
    
    func deleteCartProduct(index: Int) {
        cartRepo.deleteCartProductSource(index: index)
    }
    
    func updateCartProduct(for cartProduct: CartProduct,with count: Int) {
        let cartProductSource = cartProduct.toCartProductSource()
        cartRepo.updateCartProductSource(for: cartProductSource, with: count)
    }
    
    func getCartProductsCount(completion: @escaping (Int) -> Void) {
        $cartProducts.sink { cartProducts in
            completion(cartProducts.count)
        }
        .store(in: &cancellables)
    }
    
    func deleteAllCartProduct(completion: @escaping () -> Void) {
        cartRepo.deleteAllCartProductSource(completion: completion)
    }
}
