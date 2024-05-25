//
//  ProductDetailRepositories.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI
import Combine
protocol ProductDetailRepositories {
    var productDetailPublisher: AnyPublisher<Result<ProductDetail?, RemoteError>, Never> { get }
    func fetchProductDetail(by id : String)
    func productDetailOnDisapear()
}
