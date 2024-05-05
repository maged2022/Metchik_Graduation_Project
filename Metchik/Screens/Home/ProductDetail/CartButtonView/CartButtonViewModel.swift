//
//  CartButtonViewModel.swift
//  Metchik
//
//  Created by Hassan on 07/03/2024.
//

import Combine
class CartButtonViewModel: ObservableObject {
    private var cartUseCase: CartRepositories = CartUseCase.instance
    private var cancellables: [String: AnyCancellable] = [:]
    let coordinator: HomeTabCoordinatorProtocol
    @Published var numberOfProducts: Int = 0
    init(coordinator: HomeTabCoordinatorProtocol) {
        self.coordinator = coordinator
        updateCartProductCount()
    }
    
    private func updateCartProductCount() {
        self.cancellables["updateCartProductCount"]?.cancel()
        let cancellable = AnyCancellable(cartUseCase.getCartProductsCount()
            .sink { [weak self] count in
                self?.numberOfProducts = count
            })
        self.cancellables["updateCartProductCount"] = cancellable
    }
    
    func cartButtonPressed() {
        coordinator.showCart()
    }
}
