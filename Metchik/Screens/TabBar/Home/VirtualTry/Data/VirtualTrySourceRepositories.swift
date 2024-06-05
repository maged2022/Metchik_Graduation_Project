//
//  VirtualTrySourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import UIKit
import Network

protocol VirtualTrySourceRepositoriesProtocol {
    func uploadImageToCloudinary(image: UIImage, completion: @escaping (Result<URL, RemoteError>) -> Void)
    func requestVirtualImage(parameters: [String: Any] , completion: @escaping (Result<VirtualTryModel, RemoteError>) -> Void)
}

class VirtualTrySourceRepositories: VirtualTrySourceRepositoriesProtocol {
    let monitor = NWPathMonitor()

    func uploadImageToCloudinary(image: UIImage, completion: @escaping (Result<URL, RemoteError>) -> Void) {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                UploadImage().uploadImageToCloudinary(image: image, completion: completion)
            } else {
                completion(.failure(.authMessage(message: "Internet connection is bad 🙁")))
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func requestVirtualImage(parameters: [String: Any] , completion: @escaping (Result<VirtualTryModel, RemoteError>) -> Void) {
        let route = EndPoints.getVirtualImageWith(parameters: parameters)
        BaseRequest().request(route: route, method: .get, completion: completion)
    }
}
