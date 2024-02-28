//
//  CartViewModel.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import Foundation
import Combine
class CartViewModel: ObservableObject {

    private var productUseCase: ProductRepositories = ProductUseCase()
    private var cartUseCase: CartRepositories = CartUseCase()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var products : [Product] = []
    @Published private var cartProducts: [CartProduct] = [] {
        didSet {
            getProducts()
        }
    }
    init() {
        getCartProducts()
    }
    
    func getCartProducts() {
        cartUseCase.getCartProducts()
            .sink {[weak self] cartProducts in
            self?.cartProducts = cartProducts
        }
        .store(in: &cancellables)
    }
    
    func getProducts() {
        productUseCase.getProducts(by: cartProducts.map{$0.productID})
            .sink {[weak self] products in
            self?.products = products
        }
            .store(in: &cancellables)
    }

    func calculateTotalPrice() -> Double {
        products.map {$0.price * ( 1 - ($0.discountPercentage / 100.0))}
            .reduce(0.0, +)
    }
}
