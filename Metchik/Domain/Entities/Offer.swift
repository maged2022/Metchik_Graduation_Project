//
//  Offer.swift
//  Metchik
//
//  Created by Hassan on 19/02/2024.
//

import SwiftUI

struct Offer :Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    let promoCode: String
    let buttonTitle: String
    let backgroundImage: Image
}

extension Array where Element == OfferSource {
    
    func toOffers() -> [Offer] {
        return self.map { source in
            Offer(
                title: source.title,
                subTitle: source.subTitle,
                promoCode: source.promoCode,
                buttonTitle: source.buttonTitle,
                backgroundImage: ImageAsset(name: source.backgroundImage).swiftUIImage)
        }
    }
}
