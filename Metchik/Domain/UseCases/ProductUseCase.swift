//
//  ProductUseCase.swift
//  Metchik
//
//  Created by Hassan on 17/02/2024.
//

import Foundation

struct ProductUseCase: ProductRepositories {
    let repo = ProductSourceRepositoriesImpl()
    func getProducts() -> [Product] {
        repo.getProductsSource().map { Product(id: $0.id, name: $0.name, images: $0.images
                                               , price: $0.price, discountPrice: $0.discountPrice)}
    }
    
}
