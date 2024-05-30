//
//  WishListSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import Foundation
import Combine

protocol WishListSourceRepositories {
    func getWishListProductsSource(parameters: [String: Any], completion: @escaping (Result<MetaWishListSource, RemoteError>) -> Void)
    func addToWishListProductsSource(parameters: [String: Any], completion: @escaping (Result<Status, RemoteError>) -> Void)
    func deleteFromWishListProductSource(parameters: [String: Any], completion: @escaping (Result<Status, RemoteError>) -> Void)
}

class WishListSourceRepositoriesImpl: WishListSourceRepositories {

    func getWishListProductsSource(parameters: [String: Any], completion: @escaping (Result<MetaWishListSource, RemoteError>) -> Void) {
        let route = EndPoints.getWishList(parameters: parameters)
        BaseRequest().request(route: route, method: .get, completion: completion)
    }
    
    func addToWishListProductsSource(parameters: [String: Any], completion: @escaping (Result<Status, RemoteError>) -> Void) {
        let route = EndPoints.addToWishList(parameters: parameters)
        BaseRequest().request(route: route, method: .get, completion: completion)
    }
    
    func deleteFromWishListProductSource(parameters: [String: Any], completion: @escaping (Result<Status, RemoteError>) -> Void) {
        let route = EndPoints.removeFromWishList(parameters: parameters)
        BaseRequest().request(route: route, method: .delete, completion: completion)
    }
}
