//
//  OfferRepositories.swift
//  Metchik
//
//  Created by Hassan on 19/02/2024.
//

import Foundation
import Combine

protocol OffersRepositories {
    func getOffers() -> AnyPublisher<[Offer], Never>
}
