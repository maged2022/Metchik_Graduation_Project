//
//  ProductViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

class ProductViewModel: ObservableObject {
    private var productUseCase: ProductRepositories = ProductUseCase()
    @Published var products: [Product] = []
    
    init() {
    }
    
    func getProducts(category: String, subCategories: String) {
        productUseCase.getProducts(category: "Men", subCategories: ["Shoes"])
            .sink { [weak self] productsDectionary in
            if let products = productsDectionary["Shoes"] {
                self?.products = products
            }
        }
    }
}
