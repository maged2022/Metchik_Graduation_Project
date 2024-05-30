//
//  AuthUseCase.swift
//  Metchik
//
//  Created by Hassan on 03/05/2024.
//

import Foundation
class AuthUseCase: AuthRepositories {

    private let repo: AuthSourceRepositoriesProtocol = AuthSourceRepositories()
    static var instance = AuthUseCase()
    private init() { }
    func login(email: String, password: String, completion: @escaping (Result<String, RemoteError>) -> Void) {
        let parameters = [
            "email": email ,
            "password": password
        ]
        repo.login(parameters: parameters, completion: completion)
    }
    
    func signUp(userName: String, email: String, password: String, completion: @escaping (Result<String, RemoteError>) -> Void) {
        let parameters = [
            "userName": userName ,
            "email": email ,
            "password": password
        ]
        repo.signUp(parameters: parameters, completion: completion)
    }
    
    func getUserData(by userID: String, completion: @escaping (Result<User, RemoteError>) -> Void) {
        repo.getUserData { result in
            switch result {
            case .success(let success):
                completion(.success(success.data.user.toUser()))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
