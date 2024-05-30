//
//  SplashViewModel.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import Foundation

class SplashViewModel {
    
    var coordinator: AuthCoordinatorProtocol
    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func guestButtonPressed () {
        coordinator.showGuest()
    }
    
    func loginButtonPressed () {
        coordinator.showLogin()
    }
    
    func signUpButtonPressed () {
        coordinator.showSignUp()
    }

}
