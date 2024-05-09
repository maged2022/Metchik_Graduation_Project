//
//  ProductItemViewModel.swift
//  Metchik
//
//  Created by Hassan on 07/03/2024.
//

import SwiftUI

class ProductItemViewModel: ObservableObject {
    let product: Product
    let coordinator: HomeTabCoordinatorProtocol
    private let useCase: WishListRepositories = WishListUseCase.instance
    @AppStorage("userID") var userID: String?

    init(product: Product, coordinator: HomeTabCoordinatorProtocol) {
        self.product = product
        self.coordinator = coordinator
    }
    
    func productItemPressed() {
        coordinator.showDetails(product: product)
    }
    
    func favoriteButtonPressed() {
        if let userID {
            useCase.addToWishListProducts(userID: userID, productID: product.id) { result in
                switch result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure)
                }
            }
        } else {
            print("please login firt")
        }
    }
}
