//
//  ProductItemViewModel.swift
//  Metchik
//
//  Created by Hassan on 07/03/2024.
//

import Foundation

class ProductItemViewModel: ObservableObject {
    let product: Product
    let coordinator: HomeTabCoordinatorProtocol
    
    init(product: Product, coordinator: HomeTabCoordinatorProtocol) {
        self.product = product
        self.coordinator = coordinator
    }
    func productItemPressed() {
        coordinator.showDetails(product: product)
    }
}
