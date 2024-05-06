//
//  AuthCoordinator.swift
//  Metchik
//
//  Created by Hassan on 05/05/2024.
//

import Swinject
import SwiftUI

protocol AuthCoordinatorProtocol: Coordinator {
    func showGuest()
    func showLogin()
    func showSignUp()
    func showSignUpSuccess(token: String)
}

class AuthCoordinator: AuthCoordinatorProtocol {

    var router: Router
    var parentCoordinator: AppCoordinatorProtocol
    init(router: Router,parentCoordinator: AppCoordinatorProtocol) {
        self.router = router
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        showSplash()
    }

    func showSplash() {
        let viewModel = SplashViewModel(coordinator: self)
        let splashView = SplashView(viewModel: viewModel)
        let splashViewController = UIHostingController(rootView: splashView)
        router.push(splashViewController, animated: true)
        router.navigationController.isNavigationBarHidden = false
    }
    func showGuest() {
        parentCoordinator.showTabBar()
    }
    
    func showLogin() {
        let useCase = AuthUseCase.instance
        let viewModel = LoginViewModel(coordinator: self,useCase: useCase)
        let loginView = LoginView(viewModel: viewModel)
        let loginViewController = UIHostingController(rootView: loginView)
        router.push(loginViewController, animated: true)
    }
    
    func showSignUp() {
        let useCase = AuthUseCase.instance
        let viewModel = SignUpViewModel(coordinator: self, useCase: useCase)
        let signUpView = SignUpView(viewModel: viewModel)
        let signUpViewController = UIHostingController(rootView: signUpView)
        router.push(signUpViewController, animated: true)
    }
    
    func showSignUpSuccess(token: String) {
        print("showSignUpSuccess \(token)")
    }
    
}
