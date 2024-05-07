//
//  CoordinatorAssembly.swift
//  Metchik
//
//  Created by Hassan on 09/03/2024.
//

import Swinject
import SwiftUI

class CoordinatorAssembly: Assembly {
    
    // MARK: - Properties
    private let sharedContainer: Container
    // MARK: - Lifecycle
    init(sharedContainer: Container) {
        self.sharedContainer = sharedContainer
    }
    // MARK: - Functions
    func assemble(container: Swinject.Container) {
        
        sharedContainer.register(AppRouter.self) { _ in
            let navigationController = UINavigationController()
            return AppRouter(navigationController: navigationController)
        } 
        sharedContainer.register(TabBarRouter.self) { _ in
            let navigationController = UINavigationController()
            return TabBarRouter(navigationController: navigationController)
        }
        sharedContainer.register(AppCoordinatorProtocol.self) { resolver in
            AppCoordinator(resolver: resolver)
        }
        sharedContainer.register(AuthCoordinatorProtocol.self) { resolver in
            let appCoordinator = AppCoordinator(resolver: resolver)
            return AuthCoordinator(
                router: appCoordinator.router,
                parentCoordinator: appCoordinator
            )
        }
        sharedContainer.register(TabBarCoordinatorProtocol.self) { resolver in
            let appCoordinator = AppCoordinator(resolver: resolver)

            return TabBarCoordinator(
                router: appCoordinator.router,
                resolver: resolver,
                parentCoordinator: appCoordinator
            )
        }
        sharedContainer.register(HomeTabCoordinatorProtocol.self) { resolver in
            let appCoordinator = AppCoordinator(resolver: resolver)
            let tabBarCoordinator = TabBarCoordinator(
                router: appCoordinator.router,
                resolver: resolver,
                parentCoordinator: appCoordinator
            )
            return HomeTabCoordinator(
                router: appCoordinator.router,
                tabBarCoordinator: tabBarCoordinator,
                resolver: resolver
            )
        }
        sharedContainer.register(ProfileViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(AppCoordinatorProtocol.self)
            else {fatalError("error resolver AppCoordinatorProtocol")}
            let useCase = AuthUseCase.instance
            return ProfileViewModel(coordinator: coordinator,authUseCase: useCase)
        }
        sharedContainer.register(WishListViewModel.self) { _ in
            let useCase = WishListViewUseCase()
            return WishListViewModel(wishListUseCase: useCase)
        }
    }
}
