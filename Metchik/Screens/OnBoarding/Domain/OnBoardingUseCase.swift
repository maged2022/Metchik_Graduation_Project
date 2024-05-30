//
//  OnBoardingUseCase.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import SwiftUI

protocol OnBoardingProtocol {
    func loadItems(complition: @escaping ([OnBoardingItem]) -> Void)
}

class OnBoardingUseCase: ObservableObject, OnBoardingProtocol {
    let repo = OnBoardingRepositories()
    
    func loadItems(complition: @escaping ([OnBoardingItem]) -> Void) {
        repo.loadItems { items in
            complition(items.toItem())
        }
    }
}
