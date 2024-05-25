//
//  ProductDetailUseCase.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Combine
import SwiftUI

class ProductDetailUseCase: ProductDetailRepositories, ObservableObject {
    private var repo = ProductSourceDetailRepositoriesImpl()
    @Published private var productDetail: Result<ProductDetail?, RemoteError> = .success(nil)
    var productDetailPublisher: AnyPublisher<Result<ProductDetail?, RemoteError>, Never> { $productDetail.eraseToAnyPublisher() }

    static var instance = ProductDetailUseCase()
    private init() { }
    
    func fetchProductDetail(by id : String) {
        let parameters = ["productId": id]
        repo.getProductSourceDetail(parameters: parameters ) { result in
            switch result {
            case .success(let success):
                if let firstProduct = success.data.productContain.first {
                    self.productDetail = .success(firstProduct.toProductDetail())
                } else {
                    self.productDetail = .failure(RemoteError.authMessage(message: "No Data Related to this product please contact admin "))
                }
            case .failure(let failure):
                self.productDetail = .failure(failure)
            }
        }
    }
    
    func productDetailOnDisapear() {
        productDetail = .success(nil)
    }
}
