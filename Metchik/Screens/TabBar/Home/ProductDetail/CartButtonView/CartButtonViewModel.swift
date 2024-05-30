//
//  CartButtonViewModel.swift
//  Metchik
//
//  Created by Hassan on 07/03/2024.
//

import Combine
class CartButtonViewModel: ObservableObject {
    private var cartUseCase: CartRepositories = CartUseCase.instance
    let coordinator: HomeTabCoordinatorProtocol
    @Published var numberOfProducts: Int = 0
    init(coordinator: HomeTabCoordinatorProtocol) {
        self.coordinator = coordinator
        updateCartProductCount()
    }
    
    private func updateCartProductCount() {
        cartUseCase.getCartProductsCount { [weak self] count in
                self?.numberOfProducts = count
            }
    }
    
    func cartButtonPressed() {
        coordinator.showCart()
    }
}
