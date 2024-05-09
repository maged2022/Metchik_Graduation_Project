//
//  WishListViewModelCell.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import Foundation

class WishListViewModelCell: ObservableObject {
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
