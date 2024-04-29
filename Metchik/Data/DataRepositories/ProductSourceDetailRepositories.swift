//
//  ProductSourceDetailRepositories.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Foundation
import Network

protocol ProductSourceDetailRepositories {
    func getProductSourceDetail(parameters: [String: Any], completion: @escaping (Result<ProductSourceDetail, RemoteError>) -> Void)
}

class ProductSourceDetailRepositoriesImpl: ProductSourceDetailRepositories {
    let monitor = NWPathMonitor()
    
    func getProductSourceDetail(parameters: [String: Any], completion: @escaping (Result<ProductSourceDetail, RemoteError>) -> Void) {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                let route = EndPoints.getProductDetailWith(parameters: parameters)
                BaseRequest().request(route: route, method: .get, completion: completion)
            } else {
                let productDetail: ProductSourceDetail? = JSONDecoder().decode(forResource: "ProductSourceDetail")
                if let productDetail {
                    completion(.success(productDetail))
                } else {
                    completion(.failure(.detectError(statusCode: 400)))
                }
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
}
