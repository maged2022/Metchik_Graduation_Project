//
//  ProductSourceMock.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation
struct ProductSourceMock: ProductSourceRepositories {

    func getProductsSource() -> [ProductSource] {
        [
            ProductSource(id: "1", name: "Jacket_3", images: ["discount_image3"], price: 387.08, discountPrice: 197.08),
            ProductSource(id: "3", name: "Jacket_5", images: ["discount_image5"], price: 123.34, discountPrice: 100.34),
            ProductSource(id: "4", name: "Jacket_6", images: ["discount_image6"], price: 123.34, discountPrice: 100.34),
            ProductSource(id: "2", name: "Jacket_4", images: ["discount_image4"], price: 343.76, discountPrice: 243.76),
            ProductSource(id: "5", name: "Jacket_1", images: ["discount_image1"], price: 519.99, discountPrice: 419.99),
            ProductSource(id: "6", name: "Jacket_2", images: ["discount_image2"], price: 220.30, discountPrice: 120.30),
            ProductSource(id: "1", name: "Jacket_3", images: ["discount_image3"], price: 387.08, discountPrice: 197.08),
            ProductSource(id: "2", name: "Jacket_4", images: ["discount_image4"], price: 343.76, discountPrice: 243.76),
            ProductSource(id: "3", name: "Jacket_5", images: ["discount_image5"], price: 123.34, discountPrice: 100.34),
            ProductSource(id: "4", name: "Jacket_6", images: ["discount_image6"], price: 123.34, discountPrice: 100.34),
            ProductSource(id: "5", name: "Jacket_1", images: ["discount_image1"], price: 519.99, discountPrice: 419.99),
            ProductSource(id: "6", name: "Jacket_2", images: ["discount_image2"], price: 220.30, discountPrice: 120.30)
        ]
    }
}
