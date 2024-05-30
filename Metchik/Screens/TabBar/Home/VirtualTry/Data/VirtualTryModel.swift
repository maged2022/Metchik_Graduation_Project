//
//  VirtualTryModel.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import Foundation

struct VirtualTryModel: Codable {
    let newImageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case newImageURL = "new_image_url"
    }
}
