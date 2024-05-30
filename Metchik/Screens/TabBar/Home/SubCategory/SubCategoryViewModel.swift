//
//  SubCategoryViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation
import Combine

class SubCategoryViewModel: ObservableObject {
    private var subCategorUseCase : SubCategoryViewUseCase
    private var cancellables = Set<AnyCancellable>()
    let coordinator: HomeTabCoordinatorProtocol
    @Published var subCategories: [String] = []
    @Published var products: [String: [Product]] = [:]
    @Published var subCategoriesImages: [String: URL] = [:]

    init(subCategorUseCase: SubCategoryViewUseCase, coordinator: HomeTabCoordinatorProtocol) {
        self.subCategorUseCase = subCategorUseCase
        self.coordinator = coordinator
        bindSubCategorie()
    }

    func bindSubCategorie() {
        subCategorUseCase.$subCategories
            .receive(on: DispatchQueue.main)
            .assign(to: &$subCategories)
        subCategorUseCase.$products
            .receive(on: DispatchQueue.main)
            .assign(to: &$products)   
        subCategorUseCase.$subCategoriesImages
            .receive(on: DispatchQueue.main)
            .assign(to: &$subCategoriesImages)
        
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
        coordinator.showProductView(selectedCategory: subCategorUseCase.category, selectedSubCategory: subCategory)
    }
    
    func showSearchView() {
        coordinator.showSearchView()
    }
}
