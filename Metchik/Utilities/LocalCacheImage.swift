//
//  LocalCacheImage.swift
//  Metchik
//
//  Created by s on 14/12/2023.
//

import Foundation
import SwiftUI

class LocalCacheImage {
    
    // singleton
    static let instance: LocalCacheImage = LocalCacheImage()
    
    private init() {}
    
    var cache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    
    func saveImage(image: UIImage, name: String) {
        cache.setObject(image, forKey: name as NSString)
        print("Saving Succeed ")
    }
    
    func deleteImage(name: String) {
        cache.removeObject(forKey: name as NSString)
        print("Deleted Succeed ")
    }
    
    func getImage(name: String) -> UIImage? {
        return cache.object(forKey: name as NSString)
    }
    
}
