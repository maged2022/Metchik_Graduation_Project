//
//  VirtualTryUseCase.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import UIKit

class VirtualTryUseCase: VirtualTryRepositories {
    private var virtualTryRepo: VirtualTrySourceRepositoriesProtocol = VirtualTrySourceRepositories()

    func uploadImageToCloudinary(image: UIImage,completion: @escaping (URL) -> Void) {
        virtualTryRepo.uploadImageToCloudinary(image: image,completion: completion)
    }  
    
    func requestVirtualImage(personImageURL: URL ,productImageURL: URL ,completion: @escaping (URL) -> Void) {
        let paramters = [
            "user_picture_url":personImageURL.absoluteString,
            "garment_image_url" : productImageURL.absoluteString
        ]
        
        virtualTryRepo.requestVirtualImage(parameters: paramters) { result in
            switch result {
            case .success(let success):
                if let url = URL(string: success.newImageURL) {
                    completion(url)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
