//
//  WishListAssembly.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import Foundation
import Swinject

class WishListAssembly: Assembly {
    
    // MARK: - Properties
    private let sharedContainer: Container
    // MARK: - Lifecycle
    init(sharedContainer: Container) {
        self.sharedContainer = sharedContainer
    }
    // MARK: - Functions
    func assemble(container: Swinject.Container) {
        sharedContainer.register(WishListViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(HomeTabCoordinatorProtocol.self)
            else {fatalError("error resolver HomeTabCoordinatorProtocol")}
            let useCase = WishListViewUseCase()
            return WishListViewModel(wishListUseCase: useCase,coordinator: coordinator)
        }
        sharedContainer.register(WishListViewModelCell.self) { resolver in
            guard let coordinator = resolver.resolve(HomeTabCoordinatorProtocol.self)
            else {fatalError("error resolver HomeTabCoordinatorProtocol")}
            return WishListViewModelCell(coordinator: coordinator, product: .mockData)
        }
    }
}
