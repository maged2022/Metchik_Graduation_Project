//
//  MainCoordinator.swift
//  Metchik
//
//  Created by Hassan on 05/03/2024.
//

import UIKit
import SwiftUI
import Swinject

protocol TabBarCoordinatorProtocol: Coordinator {
    func showTabBar()
    func hideTabBar()
    func showHome()
    func showCart()
    func showFavorites()
    func showProfile()
}

class TabBarCoordinator: TabBarCoordinatorProtocol {
    let viewModel: CustomTabBarViewModelInterface = CustomTabBarViewModel.shared
   
    private let resolver : Resolver
    var router: Router
    var parentCoordinator: AppCoordinatorProtocol
    init(router: Router, resolver: Resolver, parentCoordinator: AppCoordinatorProtocol) {
        self.router = router
        self.resolver = resolver
        self.parentCoordinator = parentCoordinator
        start()
    }
    
    func start() {
        router.navigationController.navigationBar.isHidden = true
        viewModel.viewControllers = [
            homeViewController(),
            cartViewController(),
            wishListViewController(),
            profileViewController()
        ]
        let viewControler = CustomTabBarViewController(viewModel: viewModel)
        router.push(viewControler)
    }
    
    private func homeViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let coordinator = HomeTabCoordinator(router: router, tabBarCoordinator: self, resolver: resolver)
        coordinator.start()
       return navigationController
    }
    
    private func cartViewController() -> UIViewController {
        //        guard let cartViewModel = resolver.resolve(CartViewModel.self) else {fatalError()}
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let cartViewModel = CartViewModel(coordinator: self, cartUseCase: CartViewUseCase())
        let cartViewController =  UIHostingController(rootView: CartView(viewModel: cartViewModel))
        router.push(cartViewController)

        navigationController.isNavigationBarHidden = true
        return navigationController
    }
    
    private func wishListViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let useCase = WishListViewUseCase()
        let homeCoordinator = HomeTabCoordinator(router: router, tabBarCoordinator: self, resolver: resolver)
        let viewModel = WishListViewModel(wishListUseCase: useCase, coordinator: homeCoordinator)
        let wishListViewController = UIHostingController(rootView: WishListView(viewModel: viewModel))
        router.push(wishListViewController)
        return navigationController

    }
    
    private func profileViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let useCase = AuthUseCase.instance
        let viewModel = ProfileViewModel(coordinator: parentCoordinator, authUseCase: useCase)
        let profileViewController = UIHostingController(rootView: ProfileView(viewModel: viewModel))
        router.push(profileViewController)
        return navigationController
    }
}
extension TabBarCoordinator {
    
    func showTabBar() {
        self.viewModel.tabBarIsHidden = false
    }
    
    func hideTabBar() {
        viewModel.tabBarIsHidden = true
    }
    
    func showHome() {
        viewModel.selectedTab = .home
    }
    
    func showCart() {
        viewModel.selectedTab = .cart
    }
    
    func showFavorites() {
        viewModel.selectedTab = .wishList
    }
    
    func showProfile() {
        viewModel.selectedTab = .profile
    }
    private func setup(view: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        view.tabBarItem = tabBarItem
    }
}
