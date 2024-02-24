//
//  ProductDetailViewModel.swift
//  Metchik
//
//  Created by Hassan on 23/02/2024.
//

import Foundation
import Combine

class ProductDetailViewModel: ObservableObject {
    private var productUseCase: ProductDetailRepositories = ProductDetailUseCase()
    private var cancellables = Set<AnyCancellable>()
    let product: Product
    @Published var productDetail: ProductDetail = .mockData
    
    init(product: Product) {
        self.product = product
        getProductdetail(by: product.id)
    }
    
    private func getProductdetail(by id : String) {
        productUseCase.getProductDetail(by: id)
            .sink {[weak self] productDetail in
                print(" productUseCase.getProductDetail(by: id) = \(productDetail)")
            self?.productDetail = productDetail
        }
        .store(in: &cancellables)
    }
    
    func getTotalPrice() -> Double {
        return 55.5
    }
}
