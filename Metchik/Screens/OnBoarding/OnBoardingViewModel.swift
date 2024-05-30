//
//  OnBoardingViewModel.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import Foundation

class OnBoardingViewModel: ObservableObject {
    @Published var items: [OnBoardingItem] = []
    private let useCase: OnBoardingProtocol = OnBoardingUseCase()
    let coordinator: AppCoordinatorProtocol
    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
        loadItems()
    }
    
    func loadItems() {
        useCase.loadItems { items in
            self.items = items
        }
    }
    
    func nextButtonPressed() {
        coordinator.showAuth()
    }
}
