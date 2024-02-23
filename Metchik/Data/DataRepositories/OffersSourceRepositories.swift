//
//  OfferSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 19/02/2024.
//

import Foundation
import Combine

protocol OffersSourceRepositories {
    func getOffersSource() -> AnyPublisher<[OfferSource], Never>
}

class OffersSourceRepositoriesImpl: OffersSourceRepositories, ObservableObject {
    @Published private var offers: [OfferSource] = []

    init() {
        updateOffersSource()
        repeatEveryThreeSeconds()
    }
    
    private func updateOffersSource () {
        offers = JSONDecoder().decode(forResource: "OfferSource") ?? []
    }
    
    func repeatEveryThreeSeconds() {
        // Your code to be executed repeatedly
        print("Executing code every 3 seconds...")
        
        // Schedule the next execution after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
            self.updateOffersSource()
            self.repeatEveryThreeSeconds()
        }
    }
    
    func getOffersSource() -> AnyPublisher<[OfferSource], Never> {
        return $offers.eraseToAnyPublisher()
    }
}
