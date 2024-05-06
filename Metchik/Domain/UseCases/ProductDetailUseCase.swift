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
    @Published private var productDetail: Result<ProductDetail, RemoteError> = .success(.mockData)

    private var cancellables = Set<AnyCancellable>()

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
                    // Handle the case where the product array is empty
                    print("Product array is empty")
                }
            case .failure(let failure):
                self.productDetail = .failure(failure)
            }
        }
    }
    
    func getProductDetail(completion: @escaping (Result<ProductDetail, RemoteError>) -> Void) {
        $productDetail.sink { result in
            switch result {
            case .success(let productDetail):
                completion(.success(productDetail))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
        .store(in: &cancellables)
    }

    func getAvilableSizes(completion: @escaping ([ProductSizes]) -> Void) {
        $productDetail.sink { result in
            switch result {
            case .success(let productDetail):
                completion(productDetail.productAttribute.map {$0.sizes})
            case .failure(let failure):
                print(failure)
            }
        }
        .store(in: &cancellables)
    }
    
    func getAvilableColors(forSize selectedSize: ProductSizes, completion: @escaping ([Color]) -> Void) {
        $productDetail.sink { result in
            switch result {
            case .success(let productDetail):
                completion(productDetail.productAttribute
                    .first {$0.sizes == selectedSize }
                    .map {$0.colors} ?? [])
            case .failure(let failure):
                print(failure)
            }
        }
        .store(in: &cancellables)
    }
    
    func getMaxAvilableProducts(size: ProductSizes, color: Color, completion: @escaping (Int) -> Void) {
        $productDetail.sink { result in
            switch result {
            case .success(let productDetail):
                guard let sizeAttribute = productDetail.productAttribute
                    .filter({ $0.sizes == size })
                    .first,
                    let colorIndex = sizeAttribute.colors.firstIndex(where: { $0 == color }) else {
                        completion(0)
                    return
                }
                completion(sizeAttribute.avaliableInStok[colorIndex])
            case .failure(let failure):
                print(failure)
            }
        }
        .store(in: &cancellables)
    }
}
