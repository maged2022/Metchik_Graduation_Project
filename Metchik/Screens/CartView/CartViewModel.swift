//
//  CartViewModel.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import Foundation
import Combine

protocol CartViewModelProtocol {
    
}
class CartViewModel: CartViewModelProtocol , ObservableObject {
    
    private var cartUseCase: CartViewRepositories
    private let coordinator: TabBarCoordinatorProtocol
    @Published var products : [Product] = []

    @Published var cartProducts: [CartProduct] = [] {
        didSet {
            getProduct()
        }
    }

    init(coordinator: TabBarCoordinatorProtocol, cartUseCase: CartViewRepositories) {
        self.coordinator = coordinator
        self.cartUseCase = cartUseCase
        getCartProducts()
    }
    
    func getCartProducts() {
        cartUseCase.getCartProducts { cartProducts in
            self.cartProducts = cartProducts
        }
    }
    private func getProduct() {
        cartUseCase.getProduct { result in
            switch result {
            case .success(let products):
                self.products = products
            case .failure(let failure):
                print("failure  cartUseCase.getProduct \(failure)")
            }
        }
    }
    func getProduct(by cartProduct: CartProduct) -> Product {
        cartUseCase.getProduct(by: cartProduct)
    }
    
    func calculateTotalPrice() -> Double {
        cartUseCase.calculateTotalPrice()
    }
    
    func deleteCartProduct(indexSet: IndexSet) {
        cartUseCase.deleteCartProduct(indexSet: indexSet)
    }
}
