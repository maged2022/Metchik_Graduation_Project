//
//  OfferSourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 19/02/2024.
//

import Foundation
protocol OffersSourceRepositories {
    func getOffers() -> [OfferSource]
}

struct OffersSourceRepositoriesImpl: OffersSourceRepositories {
    let offers: [OfferSource] = JSONDecoder().decode(forResource: "OffersSource") ?? []

    func getOffers() -> [OfferSource] {
        if false {
            
        } else {
           return offers
        }
    }
}
