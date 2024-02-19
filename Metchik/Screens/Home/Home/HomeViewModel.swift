//
//  MainCategoryViewModel.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    let offersUseCase:HomeUseCase = HomeUseCase()
    @Published var categories: [Category] = [
        Category(name: "Men"),
        Category(name: "Women"),
        Category(name: "Kids")
        
    ]
    
    @Published var offers: [Offer] = []
    
    init() {
        updateOffers()
    }
    
    func updateOffers() {
        offers = offersUseCase.getOffers()
    }
}
