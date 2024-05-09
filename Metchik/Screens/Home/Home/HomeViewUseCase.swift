//
//  HomeViewUseCase.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import Foundation
import Combine

class HomeViewUseCase: ObservableObject {
    private let offersUseCase: OffersRepositories = OffersUseCase.instance
    private let productUseCase: ProductRepositories = ProductUseCase.instance
    private var cancellables = Set<AnyCancellable>()

    @Published var offers: [Offer] = []
    @Published var categories: [String] = []
    @Published var subCategories: [String] = []
    @Published var products: [String: [Product]] = [:]
    @Published var selectedCategory: String = "" {
        didSet {
            updateSubCategories()
            updateProducts()
        }
    }
    var productsLocal: [Product] = []
    
    init() {
        updateOffers()
        bindUseCase()
    }
    
    private func bindUseCase() {
        productUseCase.productsPublisher.sink {[weak self] result in
            switch result {
            case .success(let products):
                self?.productsLocal = products
                self?.updateCategories()
            case .failure(let failure):
                print(failure)
            }
        }
        .store(in: &cancellables)
    }
    
    private func updateOffers() {
        offersUseCase.getOffers()
            .receive(on: DispatchQueue.main)
            .assign(to: &$offers)
    }
    
    private func updateCategories() {
        self.categories = Array(Set(productsLocal.map { $0.category.capitalized })).sorted()
    }
    
    func updateSelectedCategory(selectedCategory: String) {
        self.selectedCategory = selectedCategory
    }
    
    private func updateSubCategories() {
        self.subCategories =  Set(productsLocal.filter {
            $0.category.capitalized == self.selectedCategory
        }.map { $0.subCategory.capitalized }).sorted()
    }
    
    private func updateProducts() {
        self.products = Dictionary(grouping: productsLocal.filter {
            $0.category.capitalized == self.selectedCategory
        }, by: { $0.subCategory.capitalized }).mapValues {
            $0.sorted { $0.name < $1.name }
        }
    }
}
