//
//  AuthSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 03/05/2024.
//

import Foundation

protocol AuthSourceRepositoriesProtocol {
    func login(parameters: [String: Any], completion: @escaping (Result<String, RemoteError>) -> Void)
    func signUp(parameters: [String: Any], completion: @escaping (Result<String, RemoteError>) -> Void)
}

class AuthSourceRepositories: AuthSourceRepositoriesProtocol {
    
    func login(parameters: [String: Any], completion: @escaping (Result<String, RemoteError>) -> Void) {
//        completion(.success("token 124353245"))
        completion(.failure(RemoteError.detectError(statusCode: 400)))
    }
    
    func signUp(parameters: [String: Any], completion: @escaping (Result<String, RemoteError>) -> Void) {
//        completion(.success("token 124353245"))
        completion(.failure(RemoteError.detectError(statusCode: 200)))
    }
}
