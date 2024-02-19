//
//  OfferSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 19/02/2024.
//

import Foundation
protocol HomeSourceRepositories {
    func getOffers()-> [OfferSource]
}

struct HomeSourceRepositoriesImpl: HomeSourceRepositories {
    let localOffers = HomeSourceMock()

    func getOffers() -> [OfferSource] {
        if false {
            
        } else {
           return localOffers.getOffers()
        }
    }
}
