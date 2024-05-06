//
//  CartAssembly.swift
//  Metchik
//
//  Created by Hassan on 09/03/2024.
//

import Swinject

class CartAssembly: Assembly {
    
    // MARK: - Properties
    private let sharedContainer: Container
    // MARK: - Lifecycle
    init(sharedContainer: Container) {
        self.sharedContainer = sharedContainer
    }
    // MARK: - Functions
    func assemble(container: Swinject.Container) {
        sharedContainer.register(CartViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(TabBarCoordinatorProtocol.self)
            else {fatalError("error resolver TabBarCoordinatorProtocol")}
            return CartViewModel(coordinator: coordinator, cartUseCase: CartViewUseCase())
        }  
        sharedContainer.register(CartButtonViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(HomeTabCoordinatorProtocol.self)
            else {fatalError("error resolver TabBarCoordinatorProtocol")}
            return CartButtonViewModel(coordinator: coordinator)
        }     
        sharedContainer.register(CartAndWishListViewModelCell.self) { _ in
            return CartAndWishListViewModelCell(
                product: Product.mockData,
                cartProduct: CartProduct(productID: "1", size: .l, color: .black, selectedCount: 3)
            )
        }
    }
}
