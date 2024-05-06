//
//  AppCoordinator.swift
//  Metchik
//
//  Created by Hassan on 05/03/2024.
//

import UIKit
import Swinject
import SwiftUI

protocol AppCoordinatorProtocol: Coordinator {
    func startApp(window: UIWindow)
    func showTabBar()
    func showOnboarding()
    func showAuth()
}

class AppCoordinator: AppCoordinatorProtocol {

    private let resolver : Resolver
    var isLogin = true
    var router: Router
    
    init(resolver: Resolver) {
        self.resolver = resolver
        router = AppRouter(navigationController: .init())
    }
    
    func startApp(window: UIWindow) {
        window.rootViewController = router.navigationController
        window.makeKeyAndVisible()
        start()
    }
    
    func start() {
/*       
 if notshowOnboarding && !isLogin {
 showOnboarding()
 } else if isLogin {
 showTabBar()
 } else {
showAuth()
 }
*/
        if isLogin {
            showTabBar()
        } else {
            showOnboarding()
        }
    }
    
    func showTabBar() {
        router.reset()
        TabBarCoordinator(router: router, resolver: resolver, parentCoordinator: self).start()
    }
    
    func showOnboarding() {
        let viewModel = OnBoardingViewModel(coordinator: self)
        let onBoardingView = OnBoardingView(viewModel: viewModel)
        let onBoardingViewController = UIHostingController(rootView: onBoardingView)
        router.push(onBoardingViewController)
        router.navigationController.navigationBar.isHidden = true
    }
    
    func showAuth() {
        router.reset()
        let coordinator = AuthCoordinator(router: router, parentCoordinator: self)
        coordinator.start()
    }
    
}
