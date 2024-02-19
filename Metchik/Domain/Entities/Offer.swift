//
//  Offer.swift
//  Metchik
//
//  Created by Hassan on 19/02/2024.
//

import SwiftUI

struct Offer :Identifiable {
    let id = UUID()
    let headLine: String
    let subHeadLine: String
    let promoCode: String
    let buttonTitle: String
    let backgroundImage: Image
}
