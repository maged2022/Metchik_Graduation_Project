//
//  OnBoardingRepositories.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import Foundation

class OnBoardingRepositories: ObservableObject {
    func loadItems (complition: @escaping ([OnBoardingItemModel]) -> Void) {
        let items: [OnBoardingItemModel] = JSONDecoder().decode(forResource: "OnBoardingItemSource") ?? []
        complition(items)
    }
}
