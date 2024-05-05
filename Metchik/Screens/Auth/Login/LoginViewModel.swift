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
    @Published var isLoggenActive: Bool {
        didSet {
            objectWillChange.send()
        }
    }
    @Published var showAlert = false
    @Published var alertMessage: String = "error"
    let coordinator: AuthCoordinatorProtocol
    let useCase: AuthRepositories
    init(coordinator: AuthCoordinatorProtocol, useCase: AuthRepositories) {
        self.coordinator = coordinator
        self.useCase = useCase
        isLoggenActive = true
        loginButtonBind()
    }
     
    private func loginButtonBind() {
        Publishers.CombineLatest($email, $password)
            .map { email, password in
                // Check if both email and password are not empty
                email.isEmpty || password.isEmpty
            }
            .assign(to: &$isLoggenActive)
    }
    
    private func login() {
        useCase.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success:
                self?.coordinator.showGuest()
            case .failure(let failure):
                self?.alertMessage = failure.description
                self?.showAlert = true
            }
        }
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
