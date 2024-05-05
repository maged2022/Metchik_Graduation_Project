//
//  SplashViewModel.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import Foundation

class SplashViewModel {
    
    let coordinator: AppCoordinatorProtocol
    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func guestButtonPressed () {
        coordinator.showTabBar()
    }
    
    func loginButtonPressed () {
        coordinator.showLogin()
    }
    
    func signUpButtonPressed () {
        coordinator.showSignUp()
    }

}
