//
//  OfferUseCase.swift
//  Metchik
//
//  Created by Hassan on 19/02/2024.
//

import Foundation
struct HomeUseCase: HomeRepositories {
    var offerSourceRepo: HomeSourceRepositories = HomeSourceRepositoriesImpl()
    func getOffers()-> [Offer] {
        offerSourceRepo.getOffers().map {
            Offer(headLine: $0.headLine,
                  subHeadLine: $0.subHeadLine,
                  promoCode: $0.promoCode,
                  buttonTitle: $0.buttonTitle,
                  backgroundImage: ImageAsset(name: $0.backgroundImage).swiftUIImage)}
    }
    
}
