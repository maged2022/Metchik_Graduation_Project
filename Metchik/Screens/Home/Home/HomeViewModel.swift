//
//  MainCategoryViewModel.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    let offersUseCase: OffersRepositories = OffersUseCase()
    let productUseCase: ProductRepositories = ProductUseCase()
    @Published var categories: [String] = []
    
    @Published var offers: [Offer] = []
    @Published var products: [Product] = []
    @Published var selectedCategory: String = ""
    init() {
        updateOffers()
        updateProducts()
        updateCategories()
    }
    
    private func updateOffers() {
        offers = offersUseCase.getOffers()
    }
    
    private func updateProducts() {
        products = productUseCase.getProducts(category: selectedCategory)
    }
    
    private func updateCategories() {
        let arraytemp = productUseCase.getCategories()
        selectedCategory = arraytemp[0]
        categories = arraytemp.sorted()
    }
}
