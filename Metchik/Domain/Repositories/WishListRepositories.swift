//
//  WishListRepositories.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import Foundation
protocol WishListRepositories {
    func getWishListProducts(userID: String, completion: @escaping (Result<[WishListProduct], RemoteError>) -> Void)
    func addToWishListProducts(userID: String, productID: String, completion: @escaping (Result<Status, RemoteError>) -> Void)
    func deleteFromWishListProductSource(wishListID: String, completion: @escaping (Result<Status, RemoteError>) -> Void)
}
