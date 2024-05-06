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
    @Published private var products: Result<[Product], RemoteError> = .success([])
    
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
                self.products = .success(success.data.products.toProducts())
            case .failure(let failure):
                self.products = .failure(failure)
            }
        }
    }
    
    func getCategories(completion: @escaping ([String]) -> Void) {
        return $products
            .sink { result in
                switch result {
                case .success(let products):
                    completion(Array(Set(products.map { $0.category.capitalized })).sorted())
                case .failure(let failure):
                    print(failure)
                }
            }.store(in: &cancellables)
        
    }
    
    func getSubCategories(category: String, completion: @escaping ([String]) -> Void) {
        return $products
            .sink { result in
                switch result {
                case .success(let products):
                    completion(
                        Set(products.filter {
                            $0.category.capitalized == category
                        }.map { $0.subCategory.capitalized }).sorted()
                    )
                case .failure(let failure):
                    print(failure)
                }
            }.store(in: &cancellables)
        
    }
    
    func getProducts(category: String, subCategories: [String], completion: @escaping ([String: [Product]]) -> Void) {
        return $products
            .sink { result in
                switch result {
                case .success(let products):
                    completion(Dictionary(grouping: products.filter {
                        $0.category.capitalized == category
                        }, by: { $0.subCategory.capitalized }).mapValues {
                        $0.sorted { $0.name < $1.name }
                    })
                case .failure(let failure):
                    print(failure)
                }
            }.store(in: &cancellables)
        
    }
    
    func getProducts(category: String, subCategories: String, completion: @escaping ([Product]) -> Void) {
        $products
            .sink { result in
                switch result {
                case .success(let products):
                    completion(products.filter {
                        $0.category.lowercased() == category.lowercased() &&
                        $0.subCategory.lowercased() == subCategories.lowercased()
                    })
                case .failure(let failure):
                    print(failure)
                }
            }.store(in: &cancellables)
        
    }
    
    func getProducts(by id: [String], completion: @escaping (Result<[Product], RemoteError>) -> Void) {
        $products
            .sink { result in
                switch result {
                case .success(let products):
                    completion(.success(products.filter { product in
                        id.contains { $0.lowercased() == product.id.lowercased() }
                    }))
                case .failure(let failure):
                    completion(.failure(failure))
                }
            }
            .store(in: &cancellables)
    }
}
