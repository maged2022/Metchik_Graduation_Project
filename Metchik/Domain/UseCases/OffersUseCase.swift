//
//  OfferUseCase.swift
//  Metchik
//
//  Created by Hassan on 19/02/2024.
//

import Foundation
import Combine

class OffersUseCase: OffersRepositories, ObservableObject {
    @Published private var offerSourceRepo: OffersSourceRepositories = OffersSourceRepositoriesImpl()
    @Published private var offers: [Offer] = []
    private var cancellables = Set<AnyCancellable>()
    static var instance = OffersUseCase()

    private init() {
        updateOffers()
    }
    
    private func updateOffers() {
        offerSourceRepo.getOffersSource()
            .map { $0.toOffers() }
            .sink { [weak self] offers in
                self?.offers = offers
            }
            .store(in: &cancellables)
        
    }
    func getOffers() -> AnyPublisher<[Offer], Never> {
        return $offers.eraseToAnyPublisher()
    }
    
}
