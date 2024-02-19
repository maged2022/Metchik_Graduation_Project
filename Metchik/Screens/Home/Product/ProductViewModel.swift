//
//  ProductViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

class ProductViewModel: ObservableObject {
    var productUseCase: ProductRepositories = ProductUseCase()
    @Published var products: [Product] = []
    @Published  var searchText = ""
    
    @Published var basketProducts: [Product] = []
    
    func fetchProducts(for subcategory: SubCategory) {
        self.products = productUseCase.getProducts()
    }
    
    func addProduct(product : Product) {
        self.basketProducts += [product]
    }
    
    func removeProduct(index : Int) {
        self.basketProducts.remove(at: index)
    }
    
    func totalPrice() -> Double {
          let total = basketProducts.reduce(0) { $0 + $1.discountPrice }
          return total
      }
    
}
