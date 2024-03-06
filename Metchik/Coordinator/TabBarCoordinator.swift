//
//  MainCoordinator.swift
//  Metchik
//
//  Created by Hassan on 05/03/2024.
//

import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    func showTabBar()
    func hideTabBar()
    func showHome()
    func showCart()
    func showNotifications()
    func showProfile()
}

class TabBarCoordinator: TabBarCoordinatorProtocol {
    
    var tabViewController: UITabBarController
    
    let router: Router
    init(router: Router) {
        self.router = router
        self.tabViewController = UITabBarController()
        tabViewController.tabBar.isTranslucent = true
        tabViewController.tabBar.backgroundColor = .lightGray
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
        let homeCoordinator = HomeTabCoordinator(router: router)
        let homeViewController = homeCoordinator.homeViewController
        setup(view: homeViewController ,
              title: "Home",
              imageName: "house",
              selectedImageName: "house.fill")
        return homeViewController
    }
    
    private func cartViewController() -> UIViewController {
        let cartCoordinator = CartTabCoordinator(router: router)
        let cartViewController = cartCoordinator.cartViewController
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
}
