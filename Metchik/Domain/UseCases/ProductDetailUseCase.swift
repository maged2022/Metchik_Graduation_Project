//
//  ProductDetailUseCase.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Combine
import SwiftUI

class ProductDetailUseCase: ProductDetailRepositories, ObservableObject {
    @Published private var repo = ProductSourceDetailRepositoriesImpl()
    @Published private var productDetail: ProductDetail = .mockData

    private var cancellables = Set<AnyCancellable>()

    static var instance = ProductDetailUseCase()
    private init() {
        
    }
    
    func fetchProductDetail(by id : String) {
        repo.getProductSourceDetail(by: id)
            .map { $0.toProductDetail() }
            .sink {[weak self] productDetail in
                self?.productDetail = productDetail
            }
            .store(in: &cancellables)
    }
    
    func getProductDetail() -> AnyPublisher<ProductDetail, Never> {
        $productDetail.eraseToAnyPublisher()
    }

    func getAvilableSizes() -> AnyPublisher<[ProductSizes], Never> {
        return $productDetail.map { $0.productAttribute.map {$0.sizes}} .eraseToAnyPublisher()
    }
    
    func getAvilableColors(forSize selectedSize: ProductSizes) -> AnyPublisher<[Color], Never> {
        return $productDetail
            .map({$0.productAttribute
                    .first {$0.sizes == selectedSize }
                    .map {$0.colors} ?? []
            })
            .eraseToAnyPublisher()
    }
    
    func getMaxAvilableProducts(size: ProductSizes, color: Color) -> AnyPublisher<Int, Never> {
        return $productDetail
              .map { productDetail in
                  guard let sizeAttribute = productDetail.productAttribute
                      .filter({ $0.sizes == size })
                      .first,
                      let colorIndex = sizeAttribute.colors.firstIndex(where: { $0 == color }) else {
                          return 0
                  }
                  return sizeAttribute.avaliableInStok[colorIndex]
              }
              .eraseToAnyPublisher()
    }
}
