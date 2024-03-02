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
    private var cancellables: [String: AnyCancellable] = [:]
    
    @Published var products : [Product] = []
    @Published var cartProducts: [CartProduct] = [] {
        didSet {
            getProduct()
        }
    }
    init() {
        getCartProducts()
    }
    
    func getCartProducts() {
        self.cancellables["getCartProducts"]?.cancel()
        let cancellable = AnyCancellable(cartUseCase.getCartProducts()
            .sink {[weak self] cartProducts in
                self?.cartProducts = cartProducts
            })
        self.cancellables["getCartProducts"] = cancellable
    }
    
    private func getProduct() {
        self.cancellables["getProduct"]?.cancel()
        let cancellable = AnyCancellable(productUseCase.getProducts(by: cartProducts.map {$0.productID})
            .sink {[weak self] products in
                guard let validProducts = self?.cartProducts
                    .map({cartProduct in
                        products[products.firstIndex(where: {$0.id == cartProduct.productID}) ?? 1] }) else {return}
                self?.products = validProducts
            })
        self.cancellables["getProduct"] = cancellable
    }
    
    func getProduct(by cartProduct: CartProduct) -> Product {
        products.first(where: {$0.id == cartProduct.productID}) ?? .mockData
    }
    func calculateTotalPrice() -> Double {
        products.map {$0.price * ( 1 - ($0.discountPercentage / 100.0))}
            .reduce(0.0, +)
    }
    
    func deleteCartProduct(indexSet: IndexSet) {
        cartUseCase.deleteCartProduct(indexSet: indexSet)
    }
}
