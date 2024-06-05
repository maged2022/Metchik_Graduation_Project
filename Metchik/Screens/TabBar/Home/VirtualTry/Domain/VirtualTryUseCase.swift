//
//  VirtualTryUseCase.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import UIKit

class VirtualTryUseCase: VirtualTryRepositories {
    private var virtualTryRepo: VirtualTrySourceRepositoriesProtocol = VirtualTrySourceRepositories()

    func uploadImageToCloudinary(image: UIImage,completion: @escaping (Result<URL, RemoteError>) -> Void) {
        virtualTryRepo.uploadImageToCloudinary(image: image,completion: completion)
    }  
    
    func requestVirtualImage(personImageURL: URL ,productImageURL: URL ,completion: @escaping (Result<URL?, RemoteError>) -> Void) {
        let paramters = [
            "human_img": personImageURL.absoluteString,
            "garm_img" : productImageURL.absoluteString
        ]
        
        virtualTryRepo.requestVirtualImage(parameters: paramters) { result in
            switch result {
            case .success(let success):
                if let imageUrl = success.newImageURL {
                    completion(.success(URL(string: imageUrl)))
                }
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
