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
    func showSignUpSuccess(userID: String)
    func showTabBar(userID: String)
}

class AuthCoordinator: AuthCoordinatorProtocol {
    @AppStorage("isLogin") var isLogin: Bool = false
    @AppStorage("userID") var userID: String?
    var router: Router
    var parentCoordinator: AppCoordinatorProtocol
    init(router: Router,parentCoordinator: AppCoordinatorProtocol) {
        self.router = router
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        userID = nil
        isLogin = false
        showSplash()
    }

    func showSplash() {
        let viewModel = SplashViewModel(coordinator: self)
        let splashView = SplashView(viewModel: viewModel)
        let splashViewController = UIHostingController(rootView: splashView)
        router.push(splashViewController, animated: true)
        router.navigationController.navigationBar.isHidden = false
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
    
    func showSignUpSuccess(userID: String) {
        let useCase = AuthUseCase.instance
        let viewModel = SignUpSuccessViewModel(coordinator: self,userID: userID)
        let signUpView = SignUpSuccessView(viewModel: viewModel)
        let signUpViewController = UIHostingController(rootView: signUpView)
        router.push(signUpViewController, animated: true)
    }
    
    func showTabBar(userID: String) {
        isLogin = true
        self.userID = userID
        parentCoordinator.showTabBar()
    }
}
