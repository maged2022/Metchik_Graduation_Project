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
            isFavorite: false,
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
                             colors:  source.colors.map { Color(hex: $0)})
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
            color: color.toHex(),
            selectedCount: selectedCount )
    }
  
}

extension CartProductSource {
    func toCartProduct() -> CartProduct {
        CartProduct(
            productID: productID ,
            size: ProductSizes(rawValue: size) ?? .l,
            color: Color(hex:color) ,
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
            token: token,
            age: "??"
        )
    }
    
}
extension Array where Element == WishListSource {
    
    func toWishListProducts() -> [WishListProduct] {
       return self.map { wishSource in
            WishListProduct(wishListID: wishSource.id, productID: wishSource.productID)
        }
    }
    
}
