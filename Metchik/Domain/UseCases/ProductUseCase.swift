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

    func getProducts(category: String) -> AnyPublisher<[Product], Never> {
        return $products
            .map { products in
                products.filter { $0.category.capitalized == category }
            }
            .eraseToAnyPublisher()
    }

    func getCategories() -> AnyPublisher<[String], Never> {
        return $products
             .map { products in
                 Set(products.map { $0.category }).map { $0.capitalized }
             }
             .eraseToAnyPublisher()
    }
}
