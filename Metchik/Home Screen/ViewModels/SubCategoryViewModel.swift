//
//  SubCategoryViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

class SubCategoryViewModel: ObservableObject {
    @Published var subCategories: [SubCategory] = [
        SubCategory(name: "Shoes"),
        SubCategory(name: "Clothing"),
        SubCategory(name: "Accessories")
    ]
}
