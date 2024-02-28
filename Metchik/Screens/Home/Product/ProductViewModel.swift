//
//  ProductViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    private var productUseCase: ProductRepositories = ProductUseCase()
    private var cancellables = Set<AnyCancellable>()
    var selectedCategory: String
    var selectedSubCategory: String
    @Published var products: [Product] = []
    
    init(selectedCategory: String, selectedSubCategory: String) {
        self.selectedCategory = selectedCategory
        self.selectedSubCategory = selectedSubCategory
        getProducts()
    }
    func getProducts() {
        productUseCase.getProducts(category: selectedCategory, subCategories: selectedSubCategory)
            .sink { [weak self] products in
                self?.products = products
            }
            .store(in: &cancellables)
    }
}
