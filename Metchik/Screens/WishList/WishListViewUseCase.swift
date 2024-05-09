//
//  WishListViewUseCase.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import Foundation

protocol WishListViewRepositories {
    func getWishListProducts(userID: String, completion: @escaping ([WishListProduct]) -> Void)
    func getProduct(by cartProduct: WishListProduct) -> Product
    func removeWishListProduct(wishListID: String ,completion: @escaping (Result<Status, RemoteError>) -> Void)
}
class WishListViewUseCase: ObservableObject, WishListViewRepositories {
    private var productUseCase: ProductRepositories = ProductUseCase.instance
    private var wishListProductsUseCase: WishListRepositories = WishListUseCase.instance
    
    @Published var products : [Product] = []
    @Published var wishListProducts: [WishListProduct] = [] {
        didSet {
            getProduct()
        }
    }
    
    func getWishListProducts(userID: String,completion: @escaping ([WishListProduct]) -> Void) {
        wishListProductsUseCase.getWishListProducts { result in
            switch result {
            case .success(let cartProducts):
                self.wishListProducts = cartProducts
                completion(cartProducts)
            case .failure(let failure):
                print("  wishListProductsUseCase.getWishListProducts(userID: userID) { \(failure)")
            }
        }
    }
    
    func getProduct() {
        productUseCase.getProducts(by: wishListProducts.map {$0.productID}) { result in
            switch result {
            case .success(let products):
                guard !products.isEmpty else {return}
                self.products = self.wishListProducts.map({wishListProduct in
                    products[products.firstIndex(where: {$0.id == wishListProduct.productID}) ?? 0] })
            case .failure(let failure):
                print("failure  productUseCase.getProducts(by: cartProducts.map {$0.productID}) \(failure)")
            }
        }
    }
    
    func getProduct(by cartProduct: WishListProduct) -> Product {
        products.first(where: {$0.id == cartProduct.productID}) ?? .mockData
    }
    
    func removeWishListProduct(wishListID: String, completion: @escaping (Result<Status, RemoteError>) -> Void) {
        wishListProductsUseCase.deleteFromWishListProductSource(wishListID: wishListID , completion: completion)
    }
}
