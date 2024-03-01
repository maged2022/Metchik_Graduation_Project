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
    @Published var cartProducts: [CartProduct] = [] {
        didSet {
            getProduct()
        }
    }
    init() {
        getCartProducts()
    }
    
    func getCartProducts() {
        cartUseCase.getCartProducts()
//            .receive(on: DispatchQueue.main)
            .sink {[weak self] cartProducts in
            self?.cartProducts = cartProducts
        }
        .store(in: &cancellables)
    }
    
    private func getProduct() {
        productUseCase.getProducts(by: cartProducts.map {$0.productID})
//            .receive(on: DispatchQueue.main)
            .sink {[weak self] products in
                guard let validProducts = self?.cartProducts
                    .map({cartProduct in products[products.firstIndex(where: {$0.id == cartProduct.productID}) ?? 1] }) else {return}
                self?.products = validProducts
        }
            .store(in: &cancellables)
    }

    func calculateTotalPrice() -> Double {
        products.map {$0.price * ( 1 - ($0.discountPercentage / 100.0))}
            .reduce(0.0, +)
    }
    
    func deleteCartProduct(indexSet: IndexSet) {
        cartUseCase.deleteCartProduct(indexSet: indexSet)
    }
}
