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
    
    private var cartUseCase: CartViewUseCase
    private let coordinator: TabBarCoordinatorProtocol
    @Published var products : [Product] = [] 
    @Published var cartProducts: [CartProduct] = []
    
    @Published var isCheckoutActive: Bool
    
    @Published var showAlert = false
    @Published var alertMessage: String = "error"

    init(coordinator: TabBarCoordinatorProtocol, cartUseCase: CartViewUseCase) {
        self.coordinator = coordinator
        self.cartUseCase = cartUseCase
        isCheckoutActive = true
        bindCartViewUseCase()
    }
    
    func bindCartViewUseCase() {
        cartUseCase.$cartProducts
            .receive(on: DispatchQueue.main)
            .assign(to: &$cartProducts)
        cartUseCase.$products
            .receive(on: DispatchQueue.main)
            .assign(to: &$products)
        cartUseCase.$isCheckoutActive
            .receive(on: DispatchQueue.main)
            .assign(to: &$isCheckoutActive)      
        cartUseCase.$showAlert
            .receive(on: DispatchQueue.main)
            .assign(to: &$showAlert)
        cartUseCase.$alertMessage
            .receive(on: DispatchQueue.main)
            .assign(to: &$alertMessage)
    }
    
    func getProduct(by cartProduct: CartProduct) -> Product {
        cartUseCase.getProduct(by: cartProduct)
    }
    
    func calculateTotalPrice() -> Double {
        cartUseCase.calculateTotalPrice()
    }
    
    func deleteCartProduct(index: Int) {
        cartUseCase.deleteCartProduct(index: index)
    }
    
    func showTabBar () {
        coordinator.showTabBar()
    }
    
    func pressedCheckOutButton() {
        cartUseCase.deleteAllCartProduct()
    }
}
