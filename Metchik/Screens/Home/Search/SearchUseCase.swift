//
//  SearchUseCase.swift
//  Metchik
//
//  Created by maged on 17/05/2024.
//

import Foundation
import Combine

class SearchUseCase: ObservableObject {
    
    private let productUseCase: ProductRepositories = ProductUseCase.instance
    private var cancellables = Set<AnyCancellable>()
    
    @Published var products: [Product] = []
    private var productsLocal: [Product] = []
    
    init() {
        bindUseCase()
    }
    
    private func bindUseCase() {
        productUseCase.productsPublisher.sink {[weak self] result in
            switch result {
            case .success(let products):
                self?.productsLocal = products
            case .failure(let failure):
                print(failure)
            }
        }
        .store(in: &cancellables)
    }
    
    func filterProducts(by searchText: String) {
        guard !searchText.isEmpty else {
            self.products = productsLocal
            return
        }
        
        let searchLowercased = searchText.lowercased()
        
        self.products = productsLocal.filter { product in
            // Check if the search text matches the category or subcategory exactly
            let isCategoryMatch = product.category.lowercased() == searchLowercased
            let isSubCategoryMatch = product.subCategory.lowercased() == searchLowercased
            
            // Check if the search text is contained in the product name or description
            // but avoid partial matches for names that could lead to incorrect results
            let isNameMatch = product.name.lowercased().containsWord(searchLowercased)
            let isDescriptionMatch = product.shortDescription.lowercased().containsWord(searchLowercased)
            
            // Combine all conditions
            return isCategoryMatch || isSubCategoryMatch || isNameMatch || isDescriptionMatch
        }
    }
}

extension String {
    func containsWord(_ word: String) -> Bool {
        let pattern = "\\b\(NSRegularExpression.escapedPattern(for: word))\\b"
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: self.utf16.count)
        return regex?.firstMatch(in: self, options: [], range: range) != nil
    }
}
