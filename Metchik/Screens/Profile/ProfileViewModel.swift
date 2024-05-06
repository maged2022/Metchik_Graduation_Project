//
//  ProfileViewModel.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    private let coordinator: AppCoordinatorProtocol

    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func logoutButtonPressed() {
        coordinator.showAuth()
    }
}
