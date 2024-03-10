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
    func showNotifications()
    func showProfile()
    func createCartButtonViewModel() -> CartButtonViewModel

}

class TabBarCoordinator: TabBarCoordinatorProtocol {
    
    var tabViewController: UITabBarController
    private let resolver : Resolver
    let router: Router
    
    init(router: Router, resolver: Resolver) {
        self.router = router
        self.resolver = resolver
        self.tabViewController = UITabBarController()
        tabViewController.tabBar.isTranslucent = true
        tabViewController.tabBar.backgroundColor = .lightGray
        router.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        self.tabViewController.viewControllers = [homeViewController(), cartViewController()]
        self.router.push(tabViewController)
    }
    
    func showTabBar() {
        self.tabViewController.hidesBottomBarWhenPushed = false
    }
    
    func hideTabBar() {
        self.tabViewController.hidesBottomBarWhenPushed = true
    }
    
    func showHome() {
        self.tabViewController.selectedIndex = 0
    }
    
    func showCart() {
        self.tabViewController.selectedIndex = 1
    }
    
    func showNotifications() {
        self.tabViewController.selectedIndex = 1
    }
    
    func showProfile() {
        self.tabViewController.selectedIndex = 1
    }
    
    private func homeViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let coordinator = HomeTabCoordinator(router: router, coordinator: self, resolver: resolver)
        coordinator.start()
        setup(view: navigationController ,
              title: "Home",
              imageName: "house",
              selectedImageName: "house.fill")
        return navigationController
    }
    
    private func cartViewController() -> UIViewController {
        guard let cartViewModel = resolver.resolve(CartViewModel.self) else {fatalError()}
        let cartViewController =  UIHostingController(rootView: CartView(viewModel: cartViewModel))
        router.push(cartViewController)
        setup(view: cartViewController,
              title: "Cart",
              imageName: "cart",
              selectedImageName: "cart.fill")
        return cartViewController
    }
    
    private func setup(view: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        view.tabBarItem = tabBarItem
    }
    
    func createCartButtonViewModel() -> CartButtonViewModel {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let homeCoordinator = HomeTabCoordinator(router: router, coordinator: self, resolver: resolver)
        return CartButtonViewModel(coordinator: homeCoordinator)
    }
}
