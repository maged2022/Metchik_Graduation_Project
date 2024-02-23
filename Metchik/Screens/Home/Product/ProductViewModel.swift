//
//  ProductViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    private var productUseCase: ProductRepositories = ProductUseCase()
    private var cancellables = Set<AnyCancellable>()

    @Published var products: [Product] = []
    
    func getProducts(category: String, subCategories: String) {
        productUseCase.getProducts(category: category, subCategories: [subCategories])
            .sink { [weak self] productsDectionary in
            if let products = productsDectionary[subCategories] {
                self?.products = products
            }
        }
            .store(in: &cancellables)
    }
}
