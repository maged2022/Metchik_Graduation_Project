//
//  ProductViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func fetchProducts(for subcategory: SubCategory) {
        // Simulated fetching products based on selected subcategory
        self.products = [
            Product(name: "T-Shirt1", imageName: "t-shirt1", price: 519.99),
            Product(name: "T-Shirt2", imageName: "t-shirt2", price: 220.30),
            Product(name: "T-Shirt3", imageName: "t-shirt3", price: 387.08),
            Product(name: "T-Shirt4", imageName: "t-shirt4", price: 343.76),
            Product(name: "T-Shirt5", imageName: "t-shirt5", price: 123.34),
            // Add more products
        ]
    }
}
