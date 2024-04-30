//
//  VirtualTryRepositories.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import UIKit

protocol VirtualTryRepositories {
    func uploadImageToCloudinary(image: UIImage, completion: @escaping (URL) -> Void)
    func requestVirtualImage(personImageURL: URL ,productImageURL: URL ,completion: @escaping (URL) -> Void)
}
