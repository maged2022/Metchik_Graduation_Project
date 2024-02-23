//
//  ProductRepositories.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation
import Combine
protocol ProductRepositories {
    func getCategories() -> AnyPublisher<[String], Never>
    func getSubCategories(category: String) -> AnyPublisher<[String], Never>
    func getProducts(category: String, subCategories: [String]) -> AnyPublisher<[String : [Product]], Never>
}
