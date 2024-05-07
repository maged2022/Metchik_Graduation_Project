//
//  ProfileViewModel.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    let authUseCase: AuthRepositories
    private let coordinator: AppCoordinatorProtocol
    @AppStorage("userID") var userID: String?
    var user: User = .mock
    init(coordinator: AppCoordinatorProtocol, authUseCase: AuthRepositories) {
        self.coordinator = coordinator
        self.authUseCase = authUseCase
        getUserData()
    }
    
    func getUserData() {
        if let userID = userID {
            authUseCase.getUserData(by: userID) { result in
                switch result {
                case .success(let user):
                    self.user = user
                case .failure(let failure):
                    print(" authUseCase.getUserData(by: userID)  \(failure)")
                }
            }
        }
    }
    
    func logoutButtonPressed() {
        coordinator.showAuth()
    }
}
