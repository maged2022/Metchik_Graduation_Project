//
//  ProductRepositories.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation
protocol ProductRepositories {
    func getProducts(category: String) -> [Product]
    func getCategories() -> [String]
}
