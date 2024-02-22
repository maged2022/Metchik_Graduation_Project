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
            .sink { [weak self] products in
                self?.products = products.toProducts()
            }
            .store(in: &cancellables)
    }

    func getProducts(category: String) -> AnyPublisher<[Product], Never> {
        let filteredProducts = products.filter { $0.category.capitalized == category }
        return Just(filteredProducts).eraseToAnyPublisher()
    }

    func getCategories() -> AnyPublisher<[String], Never> {
        guard !products.isEmpty else {
            return Just([]).eraseToAnyPublisher()
        }

        let uniqueCategories = Set(products.map { $0.category }).map { $0.capitalized }
        return Just(uniqueCategories).eraseToAnyPublisher()
    }
}
