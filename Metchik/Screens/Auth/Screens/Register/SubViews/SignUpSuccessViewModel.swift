//
//  SignUpSuccessViewModel.swift
//  Metchik
//
//  Created by Hassan on 07/05/2024.
//

import Foundation
class SignUpSuccessViewModel: ObservableObject {
    let userID: String
    let coordinator: AuthCoordinatorProtocol
    init(coordinator: AuthCoordinatorProtocol,userID: String) {
        self.coordinator = coordinator
        self.userID = userID
    }
    func startButtonPressed() {
        coordinator.showTabBar(userID: userID)
    }
}
