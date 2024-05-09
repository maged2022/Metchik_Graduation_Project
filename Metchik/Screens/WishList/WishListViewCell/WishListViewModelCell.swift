//
//  WishListViewModelCell.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import Foundation

class WishListViewModelCell: ObservableObject {
    private var cartUseCase: CartRepositories = CartUseCase.instance
    
    let coordinator: HomeTabCoordinatorProtocol

    @Published var product: Product = .mockData
    
    init(coordinator: HomeTabCoordinatorProtocol, product: Product) {
        self.coordinator = coordinator
        self.product = product
    }
    
    func addToCarButtonPressed() {
        coordinator.showDetails(product: product)
    }
    
}
