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
    let coordinator: HomeTabCoordinatorProtocol
    let category: String
    @Published var subCategories: [String] = [] {
        didSet {
            updateProducts()
        }
    }
    @Published var products: [String: [Product]] = [:]
    init(category: String,coordinator: HomeTabCoordinatorProtocol) {
        self.category = category
        self.coordinator = coordinator
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
    
    func isLeadingAlignment(for outerSubCategory: String) -> Bool {
      var index = 0
        for subCategory in subCategories {
            if subCategory == outerSubCategory {
                return index.isMultiple(of: 2)
            }
            index += 1
        }
        return true
    }
    
    func getProductsCount(for subCategory: String) -> Int {
        products[subCategory]?.count ?? 1
    }
    
}

extension SubCategoryViewModel {
    func subCategoryViewPressed(subCategory: String) {
        coordinator.showProductView(selectedCategory: category, selectedSubCategory: subCategory)
    }
}
