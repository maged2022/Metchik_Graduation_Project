//
//  VirtualTrySourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import UIKit

protocol VirtualTrySourceRepositoriesProtocol {
    func uploadImageToCloudinary(image: UIImage, completion: @escaping (URL) -> Void)
    func requestVirtualImage(parameters: [String: Any] , completion: @escaping (Result<VirtualTryModel, RemoteError>) -> Void)
}

class VirtualTrySourceRepositories: VirtualTrySourceRepositoriesProtocol {
    func uploadImageToCloudinary(image: UIImage, completion: @escaping (URL) -> Void) {
        UploadImage().uploadImageToCloudinary(image: image, completion: completion)
    }
    
    func requestVirtualImage(parameters: [String: Any] , completion: @escaping (Result<VirtualTryModel, RemoteError>) -> Void) {
        let route = EndPoints.getVirtualImageWith(parameters: parameters)
        BaseRequest().request(route: route, method: .get, completion: completion)
    }
}
