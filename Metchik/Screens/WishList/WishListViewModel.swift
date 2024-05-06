//
//  WishListViewModel.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import Foundation
class WishListViewModel: ObservableObject {
    private var wishListUseCase: WishListViewRepositories
    @Published var cartProducts: [CartProduct] = []
    init(wishListUseCase: WishListViewRepositories) {
        self.wishListUseCase = wishListUseCase
        getCartProducts()
    }
    func getCartProducts() {
        wishListUseCase.getCartProducts { cartProducts in
            self.cartProducts = cartProducts
        }
    }
    
    func getProduct(by cartProduct: CartProduct) -> Product {
        wishListUseCase.getProduct(by: cartProduct)
    }
}
