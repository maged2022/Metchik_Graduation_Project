//
//  ProductViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    private var productUseCase: ProductRepositories = ProductUseCase.instance
    private var cancellables = Set<AnyCancellable>()
    var selectedCategory: String
    var selectedSubCategory: String
    let coordinator: HomeCoordinatorProtocol
    @Published var products: [Product] = []
    
    init(selectedCategory: String, selectedSubCategory: String, coordinator: HomeCoordinatorProtocol) {
        self.selectedCategory = selectedCategory
        self.selectedSubCategory = selectedSubCategory
        self.coordinator = coordinator
        getProducts()
    }
    
    func getProducts() {
        productUseCase.getProducts(category: selectedCategory, subCategories: selectedSubCategory)
            .sink { [weak self] products in
                self?.products = products
            }
            .store(in: &cancellables)
    }
    
    func getProductItemViewModel(product: Product) -> ProductItemViewModel {
        coordinator.createProductItemViewModel(product: product)
    }
}
