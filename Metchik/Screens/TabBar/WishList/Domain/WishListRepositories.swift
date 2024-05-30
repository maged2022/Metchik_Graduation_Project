//
//  WishListRepositories.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import Combine
protocol WishListRepositories {
    var wishListProductsPublisher: AnyPublisher<Result<[WishListProduct], RemoteError>, Never> { get  }
    func updateWishListProducts( )
    func deleteFromWishListProductSource(wishListID: String, completion: @escaping (Result<Status, RemoteError>) -> Void)
    func favoriteButtonPressed( productID: String,completion: @escaping (Result<Status, RemoteError>) -> Void)
}
