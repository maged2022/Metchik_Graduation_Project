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
    @Published var isSignUpActive: Bool {
        didSet {
            objectWillChange.send()
        }
    }
    @Published var agreedToTerms = false
    @Published var showAlert = false
    @Published var alertMessage: String = "error"
    
    let coordinator: AuthCoordinatorProtocol
    let useCase: AuthRepositories
    init(coordinator: AuthCoordinatorProtocol, useCase: AuthUseCase) {
        self.coordinator = coordinator
        self.useCase = useCase
        isSignUpActive = true
        signUpButtonBind()
    }
    
    private func signUpButtonBind() {
        Publishers.CombineLatest4($userName, $email, $password, $confirmPassword)
            .map { userName, email, password, confirmPassword in
                userName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty
            }
            .assign(to: &$isSignUpActive)
    }
    
    func signUpButtonPressed() {
        if password != confirmPassword {
            self.alertMessage = "password not match"
            self.showAlert = true
        } else if !agreedToTerms {
            self.alertMessage = "agree terms and condition"
            self.showAlert = true
        } else {
            useCase.signUp(userName: userName, email: email, password: password) { result in
                switch result {
                case .success(let userID):
                    self.coordinator.showSignUpSuccess(userID: userID)
                case .failure(let failure):
                    self.alertMessage = failure.description
                    self.showAlert = true
                }
            }
        }
    }
}
