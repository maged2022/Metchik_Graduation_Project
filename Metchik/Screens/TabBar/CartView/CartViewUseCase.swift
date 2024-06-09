//
//  CartViewUseCase.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import Foundation
import Combine

class CartViewUseCase: ObservableObject {
    private var productUseCase: ProductRepositories = ProductUseCase.instance
    private var cartUseCase: CartRepositories = CartUseCase.instance
    private var cancellables = Set<AnyCancellable>()

    @Published var products : [Product] = [] {
        didSet {
            if products.isEmpty {
                isCheckoutActive = true
            } else {
                isCheckoutActive = false
            }
        }
    }
    @Published var cartProducts: [CartProduct] = [] {
        didSet {
            getProduct()
        }
    }
    @Published var isCheckoutActive: Bool = true
    @Published var showAlert = false
    @Published var alertMessage: String = "error"
    private var productsLocal: [Product] = []

    init() {
        bindUseCase()
    }
    
    private func bindUseCase() {
        productUseCase.productsPublisher.sink {[weak self] result in
            switch result {
            case .success(let products):
                self?.productsLocal = products
                self?.getCartProducts()
            case .failure(let failure):
                self?.showAlert = true
                self?.alertMessage = failure.localizedDescription
            }
        }
        .store(in: &cancellables)
    }
    
    func getCartProducts() {
        cartUseCase.getCartProducts {[weak self] cartProducts in
            self?.cartProducts = cartProducts
        }
    }
    
    func getProduct() {
        let products = productsLocal.filter { product in
            cartProducts.map {$0.productID} .contains { $0.lowercased() == product.id.lowercased()}}
        guard !products.isEmpty else {
            self.products = []
            return}
        self.products = self.cartProducts.map({cartProduct in
            products[products.firstIndex(where: {$0.id == cartProduct.productID}) ?? 0] })
    }
    
    func getProduct(by cartProduct: CartProduct) -> Product {
        products.first(where: {$0.id == cartProduct.productID}) ?? .mockData
    }
    
    func calculateTotalPrice() -> Double {
        products.map { product in
            let price = product.price * ( 1 - (product.discountPrecentage / 100.0))
            let cartProduct = cartProducts.first(where: {$0.productID == product.id })
            return (price * Double(cartProduct?.selectedCount ?? 1))
        }
            .reduce(0.0, +)
    }
    
    func deleteCartProduct(index: Int) {
        cartUseCase.deleteCartProduct(index: index)
    }
    
    func deleteAllCartProduct() {
        cartUseCase.deleteAllCartProduct { [weak self] in
            self?.showAlert = true
            self?.alertMessage = "Your order is on the way"
        }
    }
}
