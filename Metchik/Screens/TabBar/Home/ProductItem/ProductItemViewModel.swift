//
//  ProductItemViewModel.swift
//  Metchik
//
//  Created by Hassan on 07/03/2024.
//

import SwiftUI
import Combine
class ProductItemViewModel: ObservableObject {
    @Published var product: Product
    let coordinator: HomeTabCoordinatorProtocol
    private var cancellables = Set<AnyCancellable>()

    private let useCase: WishListRepositories = WishListUseCase.instance
    @AppStorage("userID") var userID: String?
    var callbackError : (String) -> Void
    
    init(product: Product, coordinator: HomeTabCoordinatorProtocol,callbackError: @escaping (String) -> Void) {
        self.product = product
        self.coordinator = coordinator
        self.callbackError = callbackError
        bindFavoriteValue()
    }
    
    func productItemPressed() {
        coordinator.showDetails(product: product)
    }
    
    func bindFavoriteValue() {
        if userID != nil {
            useCase.wishListProductsPublisher
                .sink { [weak self] result in
                    switch result {
                    case .success(let success):
                        DispatchQueue.main.async {
                            let state = success.filter({ $0.productID == self?.product.id}).isEmpty
                            self?.product.isFavorite = !state
                        }
                    case .failure(let failure):
                        self?.callbackError(failure.description)
                    }
                }
                .store(in: &cancellables)
        }
    }
    
    func favoriteButtonPressed() {
        useCase.favoriteButtonPressed( productID: product.id) {[weak self] result in
            switch result {
            case .success:
                self?.useCase.updateWishListProducts()
            case .failure(let failure):
                self?.callbackError(failure.description)
            }
        }
    }
}
