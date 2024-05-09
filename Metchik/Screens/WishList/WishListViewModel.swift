//
//  WishListViewModel.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import SwiftUI
class WishListViewModel: ObservableObject {
    private var wishListUseCase: WishListViewRepositories
    let coordinator: HomeTabCoordinatorProtocol
    @AppStorage("userID") var userID: String?

    @Published var wishListProducts: [WishListProduct] = []
    init(wishListUseCase: WishListViewRepositories, coordinator: HomeTabCoordinatorProtocol) {
        self.wishListUseCase = wishListUseCase
        self.coordinator = coordinator
        getCartProducts()
    }
    
    func getCartProducts() {
        if let userID {
            wishListUseCase.getWishListProducts(userID: userID) { wishListProduct in
                self.wishListProducts = wishListProduct
            }
        }
    }
    
    func getProduct(by cartProduct: WishListProduct) -> Product {
        wishListUseCase.getProduct(by: cartProduct)
    }
}
