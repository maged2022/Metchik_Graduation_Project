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
        sharedContainer.register(AppCoordinatorProtocol.self) { resolver in
            AppCoordinator(resolver: resolver)
        }
        sharedContainer.register(TabBarCoordinatorProtocol.self) { resolver in
            TabBarCoordinator(router: AppCoordinator(resolver: resolver).router, resolver: resolver)
        }
        sharedContainer.register(HomeTabCoordinatorProtocol.self) { resolver in
            let navigationController = UINavigationController()
            let router = AppRouter(navigationController: navigationController)
            let coordinator = TabBarCoordinator(router: router, resolver: resolver)
            return HomeTabCoordinator(router: router, coordinator: coordinator, resolver: resolver)
        }
    }
}
