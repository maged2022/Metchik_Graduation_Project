//
//  AuthAssembly.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//
import Swinject

class AuthAssembly: Assembly {
    
    // MARK: - Properties
    private let sharedContainer: Container
    // MARK: - Lifecycle
    init(sharedContainer: Container) {
        self.sharedContainer = sharedContainer
    }
    // MARK: - Functions
    func assemble(container: Swinject.Container) {
        sharedContainer.register(OnBoardingViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(AppCoordinatorProtocol.self)
            else {fatalError("error resolver AppCoordinatorProtocol")}
            return OnBoardingViewModel(coordinator: coordinator)
        }     
        sharedContainer.register(SplashViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(AppCoordinatorProtocol.self)
            else {fatalError("error resolver AppCoordinatorProtocol")}
            return SplashViewModel(coordinator: coordinator)
        }
        sharedContainer.register(LoginViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(AppCoordinatorProtocol.self)
            else {fatalError("error resolver AppCoordinatorProtocol")}
            return LoginViewModel(coordinator: coordinator)
        }      
        sharedContainer.register(SignUpViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(AppCoordinatorProtocol.self)
            else {fatalError("error resolver AppCoordinatorProtocol")}
            return SignUpViewModel(coordinator: coordinator)
        }
       
    }
}
