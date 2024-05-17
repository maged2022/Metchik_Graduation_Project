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
    
    func filterProducts(by searchProductId: String) {
        guard !searchProductId.isEmpty else {
            self.products = productsLocal
            return
        }
        
        self.products =  productsLocal.filter { product  in
            product.id.lowercased().contains(searchProductId.lowercased())
        }
    }
}
