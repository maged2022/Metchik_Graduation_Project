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
    let coordinator: HomeTabCoordinatorProtocol
    @Published var products: [Product] = []
    
    @Published var showAlert = false
    @Published var alertMessage: String = "error"
    
    init(selectedCategory: String, selectedSubCategory: String, coordinator: HomeTabCoordinatorProtocol) {
        self.selectedCategory = selectedCategory
        self.selectedSubCategory = selectedSubCategory
        self.coordinator = coordinator
        getProducts()
    }
    
    func getProducts() {
        productUseCase.getProducts(
            category: selectedCategory,
            subCategory: selectedSubCategory
        ) { [weak self] products in
                self?.products = products
            }
    }
    
    func getProductItemViewModel(product: Product) -> ProductItemViewModel {
        ProductItemViewModel(product: product, coordinator: coordinator) {[weak self] alertMessage in
            self?.showAlert = true
            self?.alertMessage = alertMessage
        }
    }
    
    func pressLoginButton() {
        coordinator.showAuth()
    }
}
