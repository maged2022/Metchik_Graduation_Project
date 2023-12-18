//
//  MainCategoryViewModel.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import Foundation

class MainCategoryViewModel: ObservableObject {
    @Published var categories: [Category] = [
        Category(name: "Men"),
        Category(name: "Women"),
        Category(name: "Kids"),
        
    ]
}
