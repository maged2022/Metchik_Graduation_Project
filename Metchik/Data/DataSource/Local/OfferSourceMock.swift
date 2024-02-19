//
//  OfferSourceMock.swift
//  Metchik
//
//  Created by Hassan on 19/02/2024.
//

import Foundation

struct HomeSourceMock : HomeSourceRepositories {
    func getOffers() -> [OfferSource] {
        [
            OfferSource(headLine: "50% Off", subHeadLine: "On everything today", promoCode: "With code:FSCREATION", buttonTitle: "Get Now", backgroundImage: "OfferBackground"),
            OfferSource(headLine: "30% Off", subHeadLine: "On everything today", promoCode: "With code:FSCREATION", buttonTitle: "Get Now", backgroundImage: "OfferBackground"),
            OfferSource(headLine: "60% Off", subHeadLine: "On everything today", promoCode: "With code:FSCREATION", buttonTitle: "Get Now", backgroundImage: "OfferBackground"),
            OfferSource(headLine: "70% Off", subHeadLine: "On everything today", promoCode: "With code:FSCREATION", buttonTitle: "Get Now", backgroundImage: "OfferBackground")
        
        ]
    }
    
}
