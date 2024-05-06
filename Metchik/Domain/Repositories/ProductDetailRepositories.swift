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
    func getProductDetail(completion: @escaping (Result<ProductDetail, RemoteError>) -> Void)
    func getAvilableSizes(completion: @escaping ([ProductSizes]) -> Void)
    func getAvilableColors(forSize selectedSize: ProductSizes, completion: @escaping ([Color]) -> Void)
    func getMaxAvilableProducts(size: ProductSizes, color: Color, completion: @escaping (Int) -> Void)
}
