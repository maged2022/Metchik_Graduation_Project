//
//  LoginViewModel.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import Foundation
import Combine
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoggenActive: Bool = true
    let coordinator: AppCoordinatorProtocol
    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
        loginButtonBind()
    }
     
    private func loginButtonBind() {
        Publishers.CombineLatest($email, $password)
            .map { email, password in
                // Check if both email and password are not empty
                email.isEmpty && password.isEmpty
            }
            .assign(to: &$isLoggenActive)
    }
    
    private func login() {
        coordinator.showTabBar()
    }
    
    func loginButtonPressed() {
        
        login()
    }  
    
    func loginWithFacebookButtonPressed() {
        
        login()
    }   
    
    func loginWithGoogleButtonPressed() {
        
        login()
    }
    
    func loginWithAppleButtonPressed() {
        
        login()
    }
    
}
