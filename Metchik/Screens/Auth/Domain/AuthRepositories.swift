//
//  AuthRepositories.swift
//  Metchik
//
//  Created by Hassan on 03/05/2024.
//

import Foundation
protocol AuthRepositories {
    func login(email: String, password: String, completion: @escaping (Result<String, RemoteError>) -> Void)
    func signUp(userName: String, email: String, password: String, completion: @escaping (Result<String, RemoteError>) -> Void)
    func getUserData(by userID: String, completion: @escaping (Result<User, RemoteError>) -> Void)
}
