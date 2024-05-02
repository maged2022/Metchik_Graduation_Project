//
//  SignUpViewModel.swift
//  Metchik
//
//  Created by Hassan on 03/05/2024.
//

import Combine

class SignUpViewModel: ObservableObject {
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isSignUpActive = true
    let coordinator: AppCoordinatorProtocol
    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
        signUpButtonBind()
    }
    
    private func signUpButtonBind() {
        Publishers.CombineLatest4($userName, $email, $password, $confirmPassword)
            .map { userName, email, password, confirmPassword in
                userName.isEmpty && email.isEmpty && password.isEmpty && confirmPassword.isEmpty
            }
            .assign(to: &$isSignUpActive)
    }
    
    func signUpButtonPressed() {
        coordinator.showTabBar()
    }
}
