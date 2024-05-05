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
    
    func signUpButtonPressed(completion: @escaping (RemoteError) -> Void) {
        if password != confirmPassword {
            completion(RemoteError.authMessage(message: "password not match"))
        } else if !agreedToTerms {
            completion(RemoteError.authMessage(message: "agree terms and condition"))
        } else {
            useCase.signUp(userName: userName, email: email, password: password) { result in
                switch result {
                case .success(let token):
                    self.coordinator.showSignUpSuccess(token: token)
                case .failure(let failure):
                    completion(failure)
                }
            }
        }
    }
}
