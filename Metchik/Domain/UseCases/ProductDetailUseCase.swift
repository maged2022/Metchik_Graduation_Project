//
//  ProductDetailUseCase.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Foundation
import Combine

class ProductDetailUseCase: ProductDetailRepositories, ObservableObject {
    @Published private var repo = ProductSourceDetailRepositoriesImpl()

    func getProductDetail(by id : String) -> AnyPublisher<ProductDetail, Never> {
        repo.getProductSourceDetail(by: id).map { $0.toProductDetail() }
            .eraseToAnyPublisher()
    }
}
