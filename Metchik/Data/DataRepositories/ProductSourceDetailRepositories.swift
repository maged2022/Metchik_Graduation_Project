//
//  ProductSourceDetailRepositories.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Foundation
import Combine

protocol ProductSourceDetailRepositories {
    func getProductSourceDetail(by id : String) -> AnyPublisher<ProductSourceDetail, Never>
}

class ProductSourceDetailRepositoriesImpl: ProductSourceDetailRepositories , ObservableObject {
    @Published private var productDetail: ProductSourceDetail = .mockData
    
    init() {
//        repeatEveryThreeSeconds()
//        updateProductSourceDetail(by: "1")
    }
    
    private func updateProductSourceDetail(by id : String) {
        productDetail = JSONDecoder().decode(forResource: "ProductSourceDetail") ?? .mockData
    }
    
    func repeatEveryThreeSeconds() {
        // Your code to be executed repeatedly
        print("Executing code every 3 seconds... update product detail ")
        
        // Schedule the next execution after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.updateProductSourceDetail(by: "1")
            self.repeatEveryThreeSeconds()
        }
    }
    
    func getProductSourceDetail(by id : String) -> AnyPublisher<ProductSourceDetail, Never> {
        updateProductSourceDetail(by: id)
        return $productDetail.eraseToAnyPublisher()
            
    }
        
}
