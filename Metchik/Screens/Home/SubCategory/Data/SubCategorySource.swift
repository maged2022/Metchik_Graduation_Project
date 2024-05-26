//
//  SubCategorySource.swift
//  Metchik
//
//  Created by Hassan on 26/05/2024.
//

import Foundation
// MARK: - Welcome
struct MetaSubCategorySource: Codable {
    let status: String
    let data: DataSubCategorySource
}

// MARK: - DataSubCategorySource
struct DataSubCategorySource: Codable {
    let subCategories: [SubCategorySource]
}

// MARK: - SubCategorySource
struct SubCategorySource: Codable {
    let id, title: String
    let avatar: String
    let category: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, avatar, category
        case imageURL = "imageUrl"
    }
}
