//
//  ProductUseCase.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation
import Combine

class ProductUseCase: ProductRepositories, ObservableObject {
    @Published private var repo = ProductSourceRepositoriesImpl()
    @Published private var products: [Product] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        setupObserving()
        updateProducts()
    }

    private func setupObserving() {
        $products
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }

    private func updateProducts() {
        repo.getProductsSource()
            .map { $0.toProducts() }
            .sink { [weak self] products in
                self?.products = products
            }
            .store(in: &cancellables)
    }

    func getCategories() -> AnyPublisher<[String], Never> {
        return $products
             .map { products in
                 Array(Set(products.map { $0.category }))
                     .map { $0.capitalized }
                     .sorted()
             }
             .eraseToAnyPublisher()
    }
    
    func getSubCategories(category: String) -> AnyPublisher<[String], Never> {
        return $products
            .map { products in
                products.filter { $0.category.capitalized == category }
            }
            .map { products in
                Set(products.map { $0.subCategory }).map { $0.capitalized }
                
            }
            .eraseToAnyPublisher()
    }
    
    func getProducts(category: String, subCategories: [String]) -> AnyPublisher<[String: [Product]], Never> {
        return $products
            .map { products in
                products.filter { $0.category.capitalized == category }
            }
            .map { filteredProducts in
                Dictionary(grouping: filteredProducts, by: { $0.subCategory.capitalized })
                    .mapValues { products in
                        products.sorted { $0.name < $1.name }
                    }
            }
            .eraseToAnyPublisher()
    }
}
