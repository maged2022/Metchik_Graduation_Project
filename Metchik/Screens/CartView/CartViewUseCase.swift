//
//  CartViewUseCase.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import Foundation

protocol CartViewRepositories {
    func getCartProducts(completion: @escaping ([CartProduct]) -> Void)
    func getProduct(completion: @escaping (Result<[Product],RemoteError>) -> Void)
    func getProduct(by cartProduct: CartProduct) -> Product
    func calculateTotalPrice() -> Double
    func deleteCartProduct(index: Int) 
}

class CartViewUseCase: ObservableObject, CartViewRepositories {
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
    
    func getProduct(completion: @escaping (Result<[Product],RemoteError>) -> Void) {
        productUseCase.getProducts(by: cartProducts.map {$0.productID}) { result in
            switch result {
            case .success(let products):
                guard !products.isEmpty else {return}
                self.products = self.cartProducts.map({cartProduct in
                    products[products.firstIndex(where: {$0.id == cartProduct.productID}) ?? 0] })
                completion(.success(self.products))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    func getProduct(by cartProduct: CartProduct) -> Product {
        products.first(where: {$0.id == cartProduct.productID}) ?? .mockData
    }
    
    func calculateTotalPrice() -> Double {
        products.map { product in
            let price = product.price * ( 1 - (product.discountPrecentage / 100.0))
            let cartProduct = cartProducts.first(where: {$0.productID == product.id })
            return (price * Double(cartProduct?.selectedCount ?? 1))
        }
            .reduce(0.0, +)
    }
    
    func deleteCartProduct(index: Int) {
        cartUseCase.deleteCartProduct(index: index)
    }
    
}
