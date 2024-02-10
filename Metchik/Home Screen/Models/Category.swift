//
//  Category.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import Foundation

struct Category: Identifiable{
    let id: UUID = UUID()
    let name: String
    let subCategory: [SubCategory] = [SubCategory(name: "error Category")]
}
