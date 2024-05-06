//
//  CartAndWishListViewModelCell.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import Foundation

class CartAndWishListViewModelCell: ObservableObject {
    private var cartUseCase: CartRepositories = CartUseCase.instance
    @Published var cartProduct: CartProduct
    @Published var product: Product = .mockData
    @Published var maxAvailableProduct: Int = 10 {
        didSet {
            currentStepperValue = 5
        }
    }
    @Published var currentStepperValue: Int {
        didSet {
            updateCartProduct(for: cartProduct, with: currentStepperValue)
        }
    }
    
    init(product: Product, cartProduct: CartProduct) {
        self.cartProduct = cartProduct
        self.product = product
        currentStepperValue = cartProduct.selectedCount
    }
    
    private func updateCartProduct(for cartProduct: CartProduct,with count: Int) {
        cartUseCase.updateCartProduct(for: cartProduct, with: count)
    }
}
