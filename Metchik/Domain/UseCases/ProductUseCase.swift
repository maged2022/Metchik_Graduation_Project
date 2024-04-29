//
//  ProductUseCase.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation
import Combine

class ProductUseCase: ProductRepositories, ObservableObject {
    private var repo = ProductSourceRepositoriesImpl()
    @Published private var products: [Product] = []

    private var cancellables = Set<AnyCancellable>()
    static var instance = ProductUseCase()
    
    private init() {
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
        repo.getProductsSource(parameters: [:]) { result in
            switch result {
            case .success(let success):
                self.products = success.data.products.toProducts()
            case .failure(let failure):
                print(failure)
            }
        }
    }

    func getCategories() -> AnyPublisher<[String], Never> {
        return $products
            .map { products in
                Array(Set(products.map { $0.category.capitalized }))
                    .sorted()
            }
            .eraseToAnyPublisher()
    }
    
    func getSubCategories(category: String) -> AnyPublisher<[String], Never> {
        return $products
            .map { products in
                Set(products
                    .filter { $0.category.capitalized == category }
                    .map { $0.subCategory.capitalized }
                )
                .sorted()
                
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
    
    func getProducts(category: String, subCategories: String) -> AnyPublisher< [Product], Never> {
        return $products
            .map {
                $0.filter { $0.category.lowercased() == category.lowercased() }
                    .filter { $0.subCategory.lowercased() == subCategories.lowercased() }
            }
            .eraseToAnyPublisher()
    }
    
    func getProducts(by id: [String]) -> AnyPublisher< [Product], Never> {
        return $products
            .map { products in
                products.filter { product in
                    id.contains { $0.lowercased() == product.id.lowercased() }
                }
            }
            .eraseToAnyPublisher()
    }
}
