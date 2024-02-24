//
//  ProductDetail.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import Foundation

struct ProductDetail {
    let images: [String]// url(string: images)
    let rating: Double // 1 - 5
    let review: Int
    let productAttribute: [ProductAttribute]
    let description: String
    
    static let mockData:ProductDetail = ProductDetail(images: ["discount_image4"],
                                                      rating: 4,
                                                      review: 33,
                                                      productAttribute: [
                                                        .init(
                                                            sizes: .m,
                                                            avaliableInStok: [22],
                                                            colors: ["white"])],
                                                      description: "srfsdf")
}

struct ProductAttribute {
    let sizes: ProductSizes
    let avaliableInStok: [Int]
    let colors: [String]
}

enum ProductSizes {
    case s
    case m
    case l
    case xl
    case xxl
}

extension ProductSourceDetail {
    func toProductDetail() -> ProductDetail {
        ProductDetail(images: self.images,
                      rating: self.rating,
                      review: self.review,
                      productAttribute: self.productAttribute.toProductSourceAttribute(),
                      description: self.description)
    }
}

extension Array where Element == ProductSourceAttribute {
    func toProductSourceAttribute ()-> [ProductAttribute] {
        return self.map { source in
            ProductAttribute(sizes: source.sizes.toProductSizes(),
                             avaliableInStok: source.avaliableInStok,
                             colors:  source.colors/*.map{ColorAsset(name:$0)}*/)
            
        }
    }
}
