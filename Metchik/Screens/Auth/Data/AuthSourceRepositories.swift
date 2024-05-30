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
    func getUserData(completion: @escaping (Result<MetaUserSource, RemoteError>) -> Void)
}

class AuthSourceRepositories: AuthSourceRepositoriesProtocol {
    
    func login(parameters: [String: Any], completion: @escaping (Result<String, RemoteError>) -> Void) {
        completion(.success("66355d4bba75412dfc1a829a"))
//        completion(.failure(RemoteError.detectError(statusCode: 400)))
    }
    
    func signUp(parameters: [String: Any], completion: @escaping (Result<String, RemoteError>) -> Void) {
        completion(.success("66355d4bba75412dfc1a829a"))
//        completion(.failure(RemoteError.detectError(statusCode: 200)))
    }
    
    func getUserData(completion: @escaping (Result<MetaUserSource, RemoteError>) -> Void) {
        let route = EndPoints.getUserData
        BaseRequest().request(route: route, method: .get, completion: completion)
    }
}
