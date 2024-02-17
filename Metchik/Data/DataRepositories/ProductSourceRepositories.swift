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
    var productsLocal = ProductSourceMock()
    func getProductsSource() -> [ProductSource] {

        if false {
            
        } else {
            return productsLocal.getProductsSource()
        }
    }
        
}
