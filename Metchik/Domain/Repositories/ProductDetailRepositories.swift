//
//  ProductDetailRepositories.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Foundation
import Combine
protocol ProductDetailRepositories {
    func getProductDetail(by id : String) -> AnyPublisher<ProductDetail, Never>
}
