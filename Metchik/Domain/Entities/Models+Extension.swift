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
            id: id, // Replace with the actual id property of ProductSource
            name: name,
            shortDescription: shortDescription,
            price: price,
            discountPercentage: discountPercentage,
//                    isFavorite: source.isFavorite, // Assuming isFavorite is a property of ProductSource
            mainImage: ImageAsset(name: mainImage).swiftUIImage,
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
        ProductDetail(images: self.images,
                      rating: self.rating,
                      review: self.review,
                      productAttribute: self.productAttribute.toProductSourceAttribute(),
                      description: self.description)
    }
}

extension Array where Element == ProductSourceAttribute {
    func toProductSourceAttribute() -> [ProductAttribute] {
        return self.map { source in
            ProductAttribute(sizes: source.sizes.toProductSizes(),
                             avaliableInStok: source.avaliableInStok,
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

extension CartProductSource {
    func toProductSizes (size:String) -> ProductSizes {
        switch size {
        case "s":
                .s
        case "m":
                .m
        case "l":
                .l
        case "xl":
                .xl
        case "xxl":
                .xxl
        default:
                .l
        }
    }
}

extension ProductSourceSizes {
    func toProductSizes () -> ProductSizes {
        switch self {
        case .s:
                .s
        case .m:
                .m
        case .l:
                .l
        case .xl:
                .xl
        case .xxl:
                .xxl
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
                backgroundImage: ImageAsset(name: source.backgroundImage).swiftUIImage)
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
            size: toProductSizes(size: size ),
            color: Color.fromString(color) ?? .black,
            selectedCount: selectedCount)
    }
    
//
}
//    func getColor (name: String) -> Color {
                                //        switch name {
                                //        case "Red":
                                //            return Asset.ProductColor.red.swiftUIColor
                                //        case "Blue":
                                //            return Asset.ProductColor.blue.swiftUIColor
                                //        case "Green":
                                //            return Asset.ProductColor.green.swiftUIColor
                                //        case "Black":
                                //            return Asset.ProductColor.black.swiftUIColor
                                //        case "White":
                                //            return Asset.ProductColor.white.swiftUIColor
                                //        case "Yellow":
                                //            return Asset.ProductColor.yellow.swiftUIColor
                                //        default:
                                //            return Asset.ProductColor.yellow.swiftUIColor
                                //        }
                                //    }
                                
                            //    func getColorName (color: Color) -> String {
                            //        switch color {
                            //        case .red:
                            //            return "Red"
                            //        case .blue:
                            //            return "Blue"
                            //        case .green:
                            //            return "Green"
                            //        case .black:
                            //            return "Black"
                            //        case .white:
                            //            return "White"
                            //        case .yellow:
                            //            return "Yellow"
                            //        default:
                            //            return "Yellow"
                            //        }
                            //    }
