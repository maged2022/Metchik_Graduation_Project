//
//  WishListUseCase.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import SwiftUI
import Combine

class WishListUseCase: WishListRepositories {
    private var wishListRepo: WishListSourceRepositories = WishListSourceRepositoriesImpl()
    private var productUseCase: ProductRepositories = ProductUseCase.instance
    private var wishListProducts: [WishListProduct] = []
    @AppStorage("userID") var userID: String?
    static var instance = WishListUseCase()
    private init() {
    }
    
    func getWishListProducts( completion: @escaping (Result<[WishListProduct], RemoteError>) -> Void) {
        guard let userID else {
            completion(.failure(RemoteError.authMessage(message: "Please Login First")))
            return
        }
        let parameters = [
            "userId": userID
        ]
        wishListRepo.getWishListProductsSource(parameters: parameters, completion: { result in
            switch result {
            case .success(let success):
                self.wishListProducts = success.data.userFavorites.toWishListProducts()
                self.productUseCase.updateWithWishListProducts(self.wishListProducts)
                completion(.success(self.wishListProducts))
            case .failure(let failure):
                completion(.failure(failure))
            }
        })
    }
    
    func addToWishListProducts( productID: String, completion: @escaping (Result<Status, RemoteError>) -> Void) {
        guard let userID else {
            completion(.failure(RemoteError.authMessage(message: "Please Login First")))
            return
        }
        let parameters = [
            "userId": "66355d4bba75412dfc1a829a" ,
            "productId": "663ac8dccb3de638fd0fc0e4"
        ]
        wishListRepo.addToWishListProductsSource(parameters: parameters, completion: completion)
        getWishListProducts(completion: {_ in })
    }
    
    func deleteFromWishListProductSource(wishListID: String, completion: @escaping (Result<Status, RemoteError>) -> Void) {
        guard let userID else {
            completion(.failure(RemoteError.authMessage(message: "Please Login First")))
            return
        }
        let parameters = [
            "wishListID": wishListID
        ]
        wishListRepo.deleteFromWishListProductSource(parameters: parameters, completion: completion)
        getWishListProducts( completion: {_ in })
    }
    
    func favoriteButtonPressed( productID: String,completion: @escaping (Result<Status, RemoteError>) -> Void) {
        guard let userID else {
            completion(.failure(RemoteError.authMessage(message: "Please Login First")))
        return
        }

        if let wishListID = wishListProducts.filter({$0.productID == productID}).first?.wishListID {
            self.deleteFromWishListProductSource(wishListID: wishListID, completion: completion)
        } else {
            self.addToWishListProducts( productID: productID, completion: completion)
        }
    }
}
