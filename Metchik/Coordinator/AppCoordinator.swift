//
//  AppCoordinator.swift
//  Metchik
//
//  Created by Hassan on 05/03/2024.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func showTabBar()
    func showOnboarding()
    func showAuth()
}

class AppCoordinator: AppCoordinatorProtocol {

    let window: UIWindow
    var isLogin = true
    
    var router: Router
    init(window: UIWindow) {
        
        self.window = window
        router = AppRouter(navigationController: .init())
    }
    
    func start() {
        if isLogin {
            showTabBar()
        } else {
            showOnboarding()
        }
    }
    
    func showTabBar() {
        let coordinator = TabBarCoordinator(router: self.router)
        router.reset()
        coordinator.start()
    }
    
    func showOnboarding() {
        print("showOnboarding")
    }
    
    func showAuth() {
        print("showAuth")

    }
    
}
