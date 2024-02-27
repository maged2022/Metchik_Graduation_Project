//
//  ProductDetailRepositories.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI
import Combine
protocol ProductDetailRepositories {
    func fetchProductDetail(by id : String)
    func getProductDetail() -> AnyPublisher<ProductDetail, Never>
    func getAvilableSizes() -> AnyPublisher<[ProductSizes], Never>
    func getAvilableColors (forSize selectedSize: ProductSizes) -> AnyPublisher<[Color], Never>
    func getMaxAvilableProducts(size: ProductSizes, color: Color) -> AnyPublisher<Int, Never>
}
