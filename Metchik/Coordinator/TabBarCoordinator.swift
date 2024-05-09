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
    func showHome()
    func showCart()
    func showFavorites()
    func showProfile()
}

class TabBarCoordinator: TabBarCoordinatorProtocol {
    
    private var tabViewController: UITabBarController
    private let resolver : Resolver
    var router: Router
    var parentCoordinator: AppCoordinatorProtocol
    init(router: Router, resolver: Resolver, parentCoordinator: AppCoordinatorProtocol) {
        self.router = router
        self.resolver = resolver
        self.parentCoordinator = parentCoordinator
        self.tabViewController = UITabBarController()
        tabViewController.tabBar.isTranslucent = true
        tabViewController.tabBar.backgroundColor = .lightGray
        router.navigationController.isNavigationBarHidden = true
        setupTabBarViewControllers()
    }
    
    func start() {
        router.push(tabViewController)
    }
    
    private func setupTabBarViewControllers () {
        homeViewController()
        cartViewController()
        wishListViewController()
        profileViewController()
    }
    
    private func homeViewController() {
        let navigationController = UINavigationController()
        let router = TabBarRouter(navigationController: navigationController)
        let coordinator = HomeTabCoordinator(router: router, tabBarCoordinator: self, resolver: resolver)
        coordinator.start()
        setup(view: navigationController ,
              title: "Home",
              imageName: "house",
              selectedImageName: "house.fill")
        tabViewController.viewControllers = [navigationController]
    }
    
    private func cartViewController() {
        //        guard let cartViewModel = resolver.resolve(CartViewModel.self) else {fatalError()}
        let navigationController = UINavigationController()
        let router = TabBarRouter(navigationController: navigationController)
        let cartViewModel = CartViewModel(coordinator: self, cartUseCase: CartViewUseCase())
        let cartViewController =  UIHostingController(rootView: CartView(viewModel: cartViewModel))
        router.push(cartViewController)
        setup(view: cartViewController,
              title: "Cart",
              imageName: "cart",
              selectedImageName: "cart.fill")
        navigationController.isNavigationBarHidden = true
        tabViewController.viewControllers?.append(navigationController)
    }
    
    private func wishListViewController() {
        let navigationController = UINavigationController()
        let router = TabBarRouter(navigationController: navigationController)
        let useCase = WishListViewUseCase()
        let homeCoordinator = HomeTabCoordinator(router: router, tabBarCoordinator: self, resolver: resolver)
        let viewModel = WishListViewModel(wishListUseCase: useCase, coordinator: homeCoordinator)
        let wishListViewController = UIHostingController(rootView: WishListView(viewModel: viewModel))
        router.push(wishListViewController)
        setup(view: wishListViewController,
              title: "WishList",
              imageName: "heart",
              selectedImageName: "heart.fill")
        tabViewController.viewControllers?.append(navigationController)
    }
    
    private func profileViewController() {
        let navigationController = UINavigationController()
        let router = TabBarRouter(navigationController: navigationController)
        let useCase = AuthUseCase.instance
        let viewModel = ProfileViewModel(coordinator: parentCoordinator, authUseCase: useCase)
        let profileViewController = UIHostingController(rootView: ProfileView(viewModel: viewModel))
        router.push(profileViewController)
        setup(view: profileViewController,
              title: "Profile",
              imageName: "person",
              selectedImageName: "person.fill")
        tabViewController.viewControllers?.append(navigationController)
    }
}
extension TabBarCoordinator {
    
    func showHome() {
        self.tabViewController.selectedIndex = 0
    }
    
    func showCart() {
        self.tabViewController.selectedIndex = 1
    }
    
    func showFavorites() {
        self.tabViewController.selectedIndex = 2
    }
    
    func showProfile() {
        self.tabViewController.selectedIndex = 3
    }
    
    private func setup(view: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        view.tabBarItem = tabBarItem
    }
}
