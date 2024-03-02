//
//  SubCategoryViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation
import Combine

class SubCategoryViewModel: ObservableObject {
    private let productUseCase: ProductRepositories = ProductUseCase.instance
    private var cancellables = Set<AnyCancellable>()
    
    let category: String
    @Published var subCategories: [String] = [] {
        didSet {
            updateProducts()
        }
    }
    @Published var products: [String: [Product]] = [:]
    init(category: String) {
        self.category = category
        updateSubCategories()
    }
    private func updateSubCategories() {
        productUseCase.getSubCategories(category: category)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] subCategories in
                self?.subCategories = subCategories
            }
            .store(in: &cancellables)
    }

    private func updateProducts() {
        productUseCase.getProducts(category: category, subCategories: subCategories)
            .sink { [weak self] product in
                self?.products = product
            }
            .store(in: &cancellables)
    }
    func getProductsCount(for subCategory: String) -> Int {
        products[subCategory]?.count ?? 1
    }
    
}
