//
//  Models+Extension.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI

extension ProductSource {
    func toProduct() -> Product {
        Product(
            id: id,
            name: title,
            shortDescription: shortDescription,
            price: price,
            discountPrecentage: discountPrecentage,
//                    isFavorite: source.isFavorite, 
            imageURL: URL(string: imageUrl),
            category: category,
            subCategory: subCategory
        )
    }
}

extension Array where Element == ProductSource {
    
    func toProducts() -> [Product] {
            return self.map { source in
                source.toProduct()
            }
        }
}

extension ProductSourceDetail {
    func toProductDetail() -> ProductDetail {
        ProductDetail(images: imageUrl.map {
            URL(string: $0)
        },
                      rating: self.rating,
                      review: self.review,
                      productAttribute: self.productAttribute.toProductSourceAttribute(),
                      description: self.description)
    }
}

extension Array where Element == ProductSourceAttribute {
    func toProductSourceAttribute() -> [ProductAttribute] {
        return self.map { source in
            ProductAttribute(sizes: ProductSizes(rawValue: source.sizes) ?? .l,
                             avaliableInStok: source.availableInStock,
                             colors:  source.colors.map { getColor(name: $0)})
        }
    }
    
    func getColor (name: String) -> Color {
        switch name {
        case "Red":
            return Asset.ProductColor.red.swiftUIColor
        case "Blue":
            return Asset.ProductColor.blue.swiftUIColor
        case "Green":
            return Asset.ProductColor.green.swiftUIColor
        case "Black":
            return Asset.ProductColor.black.swiftUIColor
        case "White":
            return Asset.ProductColor.white.swiftUIColor
        case "Yellow":
            return Asset.ProductColor.yellow.swiftUIColor
        default:
            return Asset.ProductColor.yellow.swiftUIColor
        }
    }
}

extension Array where Element == OfferSource {
    
    func toOffers() -> [Offer] {
        return self.map { source in
            Offer(
                title: source.title,
                subTitle: source.subTitle,
                promoCode: source.promoCode,
                buttonTitle: source.buttonTitle,
                backgroundImage: ImageAsset(name: "Images/\(source.backgroundImage)").swiftUIImage)
        }
    }
}

extension CartProduct {
    func toCartProductSource() -> CartProductSource {
        CartProductSource(
            productID: productID,
            size: size.rawValue,
            color: color.toString(),
            selectedCount: selectedCount )
    }
  
}

extension CartProductSource {
    func toCartProduct() -> CartProduct {
        CartProduct(
            productID: productID ,
            size: ProductSizes(rawValue: size) ?? .l,
            color: Color.fromString(color) ?? .black,
            selectedCount: selectedCount)
    }
    
}

extension UserSource {
    func toUser() -> User {
        User(
            id: id,
            userName: userName,
            email: email,
            password: password,
            role: role,
            avatar: avatar,
            imageURL: imageURL,
            token: token
        )
    }
    
}
