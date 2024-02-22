//
//  MainCategoryViewModel.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject {
    private let offersUseCase: OffersRepositories = OffersUseCase()
    private let productUseCase: ProductRepositories = ProductUseCase()
    private var cancellables =  Set<AnyCancellable>()
    
    @Published var categories: [String] = []
    @Published var offers: [Offer] = []
    @Published var products: [Product] = []
    @Published var selectedCategory: String = "" {
        didSet {
            updateProducts()
        }
    }
    
    init() {
        updateOffers()
        updateCategories()
    }
    
    private func updateOffers() {
        offers = offersUseCase.getOffers()
    }
    
    private func updateProducts() {
        productUseCase.getProducts(category: selectedCategory)
            .sink {[weak self] product in
            self?.products = product
        }.store(in: &cancellables)
    }
    
    private func updateCategories() {
        productUseCase.getCategories()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] categories in
                self?.categories = categories
                if let firstCategory = categories.first {
                    self?.selectedCategory = firstCategory
                }
            }
            .store(in: &cancellables)
    }
}
