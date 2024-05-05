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
    let coordinator: AuthCoordinatorProtocol
    let useCase: AuthRepositories
    init(coordinator: AuthCoordinatorProtocol, useCase: AuthRepositories) {
        self.coordinator = coordinator
        self.useCase = useCase
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
    
    private func login(completion: @escaping (RemoteError) -> Void) {
        useCase.login(email: email, password: password) { result in
        useCase.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success:
                self?.coordinator.showGuest()
            case .failure(let failure):
                completion(failure)
            }
        }
    }
    
    func loginButtonPressed(completion: @escaping (RemoteError) -> Void) {
        
        login(completion: completion)
    }
    
    func loginWithFacebookButtonPressed(completion: @escaping (RemoteError) -> Void) {
        
        login(completion: completion)
    }
    
    func loginWithGoogleButtonPressed(completion: @escaping (RemoteError) -> Void) {
        
        login(completion: completion)
    }
    
    func loginWithAppleButtonPressed(completion: @escaping (RemoteError) -> Void) {
        
        login(completion: completion)
    }
    
}
