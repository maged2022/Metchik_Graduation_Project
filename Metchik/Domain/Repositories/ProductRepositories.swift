//
//  ProductRepositories.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation
import Combine
protocol ProductRepositories {
    func getProducts(category: String) -> AnyPublisher<[Product], Never> 
    func getCategories() -> AnyPublisher<[String], Never>
}
