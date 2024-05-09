//
//  WishListUseCase.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import SwiftUI
import Combine

class WishListUseCase: WishListRepositories {
    @Published private var wishListRepo: WishListSourceRepositories = WishListSourceRepositoriesImpl()
    static var instance = WishListUseCase()
    private init() {
    }
    
    func getWishListProducts(userID: String, completion: @escaping (Result<[WishListProduct], RemoteError>) -> Void) {
        let parameters = [
            "userId": userID
        ]
        wishListRepo.getWishListProductsSource(parameters: parameters, completion: { result in
            switch result {
            case .success(let success):
                completion(.success(success.data.userFavorites.toWishListProducts()))
            case .failure(let failure):
                completion(.failure(failure))
            }
        })
    }
    
    func addToWishListProducts(userID: String, productID: String, completion: @escaping (Result<Status, RemoteError>) -> Void) {
        let parameters = [
            "userId": "66355d4bba75412dfc1a829a" ,
            "productId": "663ac8dccb3de638fd0fc0e4"
        ]
        wishListRepo.addToWishListProductsSource(parameters: parameters, completion: completion)
    }
    
    func deleteFromWishListProductSource(wishListID: String, completion: @escaping (Result<Status, RemoteError>) -> Void) {
        let parameters = [
            "wishListID": wishListID
        ]
        wishListRepo.deleteFromWishListProductSource(parameters: parameters, completion: completion)
      
    }
}
