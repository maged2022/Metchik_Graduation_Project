//
//  UploadImage.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import UIKit
import Cloudinary

class UploadImage {
    func uploadImageToCloudinary(image: UIImage, completion: @escaping (URL) -> Void) {
        let config = CLDConfiguration(cloudName: "daapjokhn", secure: true)
        let cloudinary = CLDCloudinary(configuration: config)
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {return }
        
        let uploader = cloudinary.createUploader()
        uploader.upload(data: imageData, uploadPreset: "test_preset", progress: nil) { (result, error) in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                return
            }
            if let result = result, let urlString = result.url,let url = URL(string: urlString) {
                print("Image uploaded successfully. Secure URL: \(urlString)")
                completion(url)
            }
        }
    }
}
