//
//  ProductViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published  var searchText = ""
    
    @Published var basketProducts: [Product] = []
    
    func fetchProducts(for subcategory: SubCategory) {
        // Simulated fetching products based on selected subcategory
        self.products = [
            
            Product(id: "1", name: "Jacket_3", images: ["discount_image3"], price: 387.08, discountPrice: 197.08),
            Product(id: "3", name: "Jacket_5", images: ["discount_image5"], price: 123.34, discountPrice: 100.34),
            Product(id: "4", name: "Jacket_6", images: ["discount_image6"], price: 123.34, discountPrice: 100.34),
            Product(id: "2", name: "Jacket_4", images: ["discount_image4"], price: 343.76, discountPrice: 243.76),
            Product(id: "5", name: "Jacket_1", images: ["discount_image1"], price: 519.99, discountPrice: 419.99),
            Product(id: "6", name: "Jacket_2", images: ["discount_image2"], price: 220.30, discountPrice: 120.30),
            Product(id: "1", name: "Jacket_3", images: ["discount_image3"], price: 387.08, discountPrice: 197.08),
            Product(id: "2", name: "Jacket_4", images: ["discount_image4"], price: 343.76, discountPrice: 243.76),
            Product(id: "3", name: "Jacket_5", images: ["discount_image5"], price: 123.34, discountPrice: 100.34),
            Product(id: "4", name: "Jacket_6", images: ["discount_image6"], price: 123.34, discountPrice: 100.34),
            Product(id: "5", name: "Jacket_1", images: ["discount_image1"], price: 519.99, discountPrice: 419.99),
            Product(id: "6", name: "Jacket_2", images: ["discount_image2"], price: 220.30, discountPrice: 120.30),
            // Add more products
        ]
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
