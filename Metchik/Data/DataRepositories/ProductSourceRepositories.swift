//
//  ProductSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation
import Network

protocol ProductSourceRepositories {
    func getProductsSource(parameters: [String: Any], completion: @escaping (Result<MetaProductSource, RemoteError>) -> Void)
}

class ProductSourceRepositoriesImpl: ProductSourceRepositories {
    let monitor = NWPathMonitor()

    func getProductsSource(parameters: [String: Any], completion: @escaping (Result<MetaProductSource, RemoteError>) -> Void) {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                let route = EndPoints.getProductsWith(parameters: parameters)
                BaseRequest().request(route: route, method: .get, completion: completion)
            } else {
                let products: MetaProductSource? = JSONDecoder().decode(forResource: "ProductSource")
                if let products = products {
                    completion(.success(products))
                } else {
                    completion(.failure(.detectError(statusCode: 400)))
                }
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
       
    }
        
}
