//
//  DiscountViewModel.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import Foundation

class DiscountViewModel: ObservableObject {
    @Published var discounts: [Discount] = [
        Discount(imageName: "discount_image6", oldPrice: 514.12, newPrice: 354.21),
        Discount(imageName: "discount_image5", oldPrice: 514.12, newPrice: 354.21),
        Discount(imageName: "discount_image4", oldPrice: 514.12, newPrice: 354.21),
        Discount(imageName: "discount_image3", oldPrice: 514.12, newPrice: 354.21),
        Discount(imageName: "discount_image2", oldPrice: 514.12, newPrice: 354.21),
        Discount(imageName: "discount_image1", oldPrice: 514.12, newPrice: 354.21),
    ]
}
