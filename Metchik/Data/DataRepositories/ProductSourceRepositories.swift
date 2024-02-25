//
//  ProductSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation
import Combine

protocol ProductSourceRepositories {
    func getProductsSource() -> AnyPublisher<[ProductSource], Never> 
}

class ProductSourceRepositoriesImpl: ProductSourceRepositories , ObservableObject {
    @Published private var products: [ProductSource] = []
    
    init() {
//        repeatEveryThreeSeconds()
        updateProductsSource()
    }
    private func updateProductsSource () {
        products = JSONDecoder().decode(forResource: "ProductSource") ?? []
//        let product:[ProductSource] = JSONDecoder().decode(forResource: "ProductSource") ?? []
//        products.append(contentsOf: product)
//        print("products from updateProductsSource \(products)")
    }
    
    func repeatEveryThreeSeconds() {
        // Your code to be executed repeatedly
        print("Executing code every 3 seconds... update product")
        
        // Schedule the next execution after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
            self.updateProductsSource()
            self.repeatEveryThreeSeconds()
        }
    }
    func getProductsSource() -> AnyPublisher<[ProductSource], Never> {
        return $products.eraseToAnyPublisher()
        }
        
}
