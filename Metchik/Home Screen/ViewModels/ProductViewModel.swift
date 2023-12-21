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
    
    func fetchProducts(for subcategory: SubCategory) {
        // Simulated fetching products based on selected subcategory
        self.products = [
           
            Product(name: "T-Shirt3", imageName: "discount_image3", price: 387.08, discountPrice: 197.08),
            Product(name: "T-Shirt4", imageName: "discount_image4", price: 343.76, discountPrice: 243.76),
            Product(name: "T-Shirt5", imageName: "discount_image5", price: 123.34, discountPrice: 100.34),
            Product(name: "T-Shirt5", imageName: "discount_image6", price: 123.34, discountPrice: 100.34),
            Product(name: "T-Shirt1", imageName: "discount_image1", price: 519.99, discountPrice: 419.99),
            Product(name: "T-Shirt2", imageName: "discount_image2", price: 220.30, discountPrice: 120.30),
            Product(name: "T-Shirt3", imageName: "discount_image3", price: 387.08, discountPrice: 197.08),
            Product(name: "T-Shirt4", imageName: "discount_image4", price: 343.76, discountPrice: 243.76),
            Product(name: "T-Shirt5", imageName: "discount_image5", price: 123.34, discountPrice: 100.34),
            Product(name: "T-Shirt5", imageName: "discount_image6", price: 123.34, discountPrice: 100.34),
            Product(name: "T-Shirt1", imageName: "discount_image1", price: 519.99, discountPrice: 419.99),
            Product(name: "T-Shirt2", imageName: "discount_image2", price: 220.30, discountPrice: 120.30),
            // Add more products
        ]
    }
}
