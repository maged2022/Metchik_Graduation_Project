//
//  ProductUseCase.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation

struct ProductUseCase: ProductRepositories {
    let repo = ProductSourceRepositoriesImpl()
    init() {
       
    }
    private func updateProducts() -> [Product] {
        repo.getProductsSource().map {$0.toProduct()}
    }
    func getProducts(category:String) -> [Product] {
        
        let temp = updateProducts().filter {
            $0.category == category
        }
        print(temp)
        return temp
    }
    func getCategories() -> [String] {
        let temps: [String] = updateProducts()
            .map { $0.category  }
        var setTemp: Set<String> = []
        for temp in temps {
            setTemp.insert(temp)
        }
        var arraytemp = setTemp.map { $0.capitalized }
        return arraytemp
    }
    
}
