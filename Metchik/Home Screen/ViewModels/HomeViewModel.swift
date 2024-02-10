//
//  MainCategoryViewModel.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var categories: [Category] = [
        Category(name: "Men"),
        Category(name: "Women"),
        Category(name: "Kids"),
        
    ]
}
