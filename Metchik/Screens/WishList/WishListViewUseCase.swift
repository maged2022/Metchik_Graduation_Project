//
//  WishListViewUseCase.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import Foundation

protocol WishListViewRepositories {
    func getCartProducts(completion: @escaping ([CartProduct]) -> Void)
    func getProduct(by cartProduct: CartProduct) -> Product
}
class WishListViewUseCase: ObservableObject, WishListViewRepositories {
    private var productUseCase: ProductRepositories = ProductUseCase.instance
    private var cartUseCase: CartRepositories = CartUseCase.instance
    
    @Published var products : [Product] = []
    @Published var cartProducts: [CartProduct] = []

    func getCartProducts(completion: @escaping ([CartProduct]) -> Void) {
        cartUseCase.getCartProducts { cartProducts in
            self.cartProducts = cartProducts
            completion(cartProducts)
        }
    }
    
    func getProduct() {
        productUseCase.getProducts(by: cartProducts.map {$0.productID}) { result in
            switch result {
            case .success(let products):
                guard !products.isEmpty else {return}
                self.products = self.cartProducts.map({cartProduct in
                    products[products.firstIndex(where: {$0.id == cartProduct.productID}) ?? 0] })
            case .failure(let failure):
                print("failure  productUseCase.getProducts(by: cartProducts.map {$0.productID}) \(failure)")
            }
        }
    }
    
    func getProduct(by cartProduct: CartProduct) -> Product {
        products.first(where: {$0.id == cartProduct.productID}) ?? .mockData
    }
    
}
