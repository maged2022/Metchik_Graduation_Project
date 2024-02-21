//
//  OfferUseCase.swift
//  Metchik
//
//  Created by Hassan on 19/02/2024.
//

import Foundation
struct OffersUseCase: OffersRepositories {
    var offerSourceRepo: OffersSourceRepositories = OffersSourceRepositoriesImpl()
    func getOffers() -> [Offer] {
        offerSourceRepo.getOffers().map {
            Offer(title: $0.title,
                  subTitle: $0.subTitle,
                  promoCode: $0.promoCode,
                  buttonTitle: $0.buttonTitle,
                  backgroundImage: ImageAsset(name: $0.backgroundImage).swiftUIImage)}
    }
    
}
