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

    @Published var wishListProducts: Result<[WishListProduct], RemoteError> = .success([])
    var wishListProductsPublisher: AnyPublisher<Result<[WishListProduct], RemoteError>, Never> {
        $wishListProducts.eraseToAnyPublisher()
    }
    @AppStorage("userID") var userID: String?
    static var instance = WishListUseCase()
    private init() {
    }
    
    func updateWishListProducts( ) {
        guard let userID = userID else {
            wishListProducts = .failure(RemoteError.authMessage(message: "Can't get wishlist Please Login First"))
            return
        }
        let parameters = [
            "userId": userID
        ]
        wishListRepo.getWishListProductsSource(parameters: parameters, completion: { result in
            switch result {
            case .success(let success):
                let wishListProducts = success.data.userFavorites.toWishListProducts()
                self.wishListProducts = .success(wishListProducts)
            case .failure(let failure):
                self.wishListProducts = .failure(failure)
            }
        })
        
    }
    
    private func addToWishListProducts( productID: String, completion: @escaping (Result<Status, RemoteError>) -> Void) {
        guard let userID = userID else {
            completion(.failure(RemoteError.authMessage(message: "Please Login First")))
            return
        }
        let parameters = [
            "userId": userID ,
            "productId": productID
        ]
        wishListRepo.addToWishListProductsSource(parameters: parameters, completion: completion)
    }
    
    func deleteFromWishListProductSource(wishListID: String, completion: @escaping (Result<Status, RemoteError>) -> Void) {
        let parameters = [
            "_id": wishListID
        ]
        wishListRepo.deleteFromWishListProductSource(parameters: parameters, completion: completion)
    }
    
    func favoriteButtonPressed( productID: String,completion: @escaping (Result<Status, RemoteError>) -> Void) {
        guard userID != nil else {
            completion(.failure(RemoteError.authMessage(message: "you can't add to favorite , Please Login First")))
        return
        }
        
        _ = wishListProducts.map({
            if let wishListID = $0.filter({$0.productID == productID}).first?.wishListID {
                self.deleteFromWishListProductSource(wishListID: wishListID, completion: completion)
            } else {
                self.addToWishListProducts( productID: productID, completion: completion)
            }
            
        })
    }
}
