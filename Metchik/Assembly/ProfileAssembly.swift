//
//  ProfileAssembly.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import Swinject
import SwiftUI

class ProfileAssembly: Assembly {
    
    // MARK: - Properties
    private let sharedContainer: Container
    // MARK: - Lifecycle
    init(sharedContainer: Container) {
        self.sharedContainer = sharedContainer
    }
    // MARK: - Functions
    func assemble(container: Swinject.Container) {
        
        sharedContainer.register(ProfileViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(AppCoordinatorProtocol.self)
            else {fatalError("error resolver AppCoordinatorProtocol")}
            let useCase = AuthUseCase.instance
            return ProfileViewModel(coordinator: coordinator,authUseCase: useCase)
        }

    }
}
