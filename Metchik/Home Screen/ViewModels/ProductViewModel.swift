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
            Product(name: "T-Shirt1", imageName: "tshirt", price: 19.99),
            Product(name: "T-Shirt2", imageName: "tshirt2", price: 20.30),
            Product(name: "T-Shirt3", imageName: "tshirt3", price: 87.08),
            // Add more products
        ]
    }
}
