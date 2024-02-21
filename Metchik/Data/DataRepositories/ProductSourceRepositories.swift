//
//  ProductSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation
protocol ProductSourceRepositories {
    func getProductsSource() -> [ProductSource]
}

struct ProductSourceRepositoriesImpl: ProductSourceRepositories {
    let products: [ProductSource] = JSONDecoder().decode(forResource: "ProductSource") ?? []
    func getProductsSource() -> [ProductSource] {

        if false {
            
        } else {
           return products
        }
    }
        
}
