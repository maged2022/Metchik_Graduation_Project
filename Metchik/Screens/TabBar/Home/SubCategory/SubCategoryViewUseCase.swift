//
//  SubCategoryViewUseCase.swift
//  Metchik
//
//  Created by Hassan on 26/05/2024.
//

import Foundation
import Combine
class SubCategoryViewUseCase {
    private let subCategoryUseCase: SubCategoryRepositories = SubCategoryUseCase.instance
    private let productUseCase: ProductRepositories = ProductUseCase.instance
    private var cancellables = Set<AnyCancellable>()
    let category: String
    @Published var subCategories: [String] = [] {
        didSet {
            updateProducts()
        }
    }
    @Published var products: [String: [Product]] = [:]
    var productsLocal: [Product] = []
    @Published var subCategoriesImages: [String: URL] = [:]
    init(category: String) {
        self.category = category
        bindUseCase()
    }
    
    private func bindUseCase() {
        productUseCase.productsPublisher.sink {[weak self] result in
            switch result {
            case .success(let products):
                self?.productsLocal = products
                self?.updateSubCategories()
            case .failure(let failure):
                print(failure)
            }
        }
        .store(in: &cancellables)
    }
    
    private func updateSubCategories() {
        subCategoriesImages = [:]
        subCategories = Set(productsLocal.filter {
            $0.category.capitalized == category
        }.map { 
            let subcategory = $0.subCategory.capitalized
            getSubCategoryImage(subCategory: subcategory)
            return subcategory })
        .sorted()
        
    }
    
    private func updateProducts() {
        products = Dictionary(grouping: productsLocal.filter {
            $0.category.capitalized == category
        }, by: { $0.subCategory.capitalized }).mapValues {
            $0.sorted { $0.name < $1.name }
        }
    }
    
    func getSubCategoryImage(subCategory: String) {
        subCategoryUseCase.getSubCategoryImage(category: category, subCategory: subCategory) {[weak self] url in
            if let url = url {
                self?.subCategoriesImages[subCategory] = URL(string: url)
            }
        }
    }
}
