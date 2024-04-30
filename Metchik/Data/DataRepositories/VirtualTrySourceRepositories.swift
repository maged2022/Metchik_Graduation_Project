//
//  VirtualTrySourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import UIKit

protocol VirtualTrySourceRepositoriesProtocol {
    func uploadImageToCloudinary(image: UIImage, completion: @escaping (URL) -> Void)
    func requestVirtualImage(parameters: [String: Any] , completion: @escaping (Result<VirtualTrySource, RemoteError>) -> Void)
}

class VirtualTrySourceRepositories: VirtualTrySourceRepositoriesProtocol {
    func uploadImageToCloudinary(image: UIImage, completion: @escaping (URL) -> Void) {
//        UploadImage().uploadImageToCloudinary(image: image, completion: completion)
        if let url = URL(
            string: 
                """
https://encrypted-tbn0.gstatic.com/images?
q=tbn:ANd9GcRF-_d9jnE2w7Mt00B2RWtJXdAK97ogKFF1L7ZBlQy4D6m0THKPlLzesu9D&s=10
"""
        ) {
            completion(url)
        }
    }
    
    func requestVirtualImage(parameters: [String: Any] , completion: @escaping (Result<VirtualTrySource, RemoteError>) -> Void) {
//        let route = EndPoints.getVirtualImageWith(parameters: parameters)
//        BaseRequest().request(route: route, method: .post, completion: completion)
        completion(
            .success(
                VirtualTrySource(
                    newImageURL:
                        "https://res.cloudinary.com/ddy3f2qew/image/upload/v1714509513/20240430T233830209687.png"
                )
            )
        )
    }
}
