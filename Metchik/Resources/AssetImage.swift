// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum AssetImage {
  internal static let offerBackground = ImageAsset(name: "OfferBackground")
  internal static let kidsAccessories = ImageAsset(name: "Kids Accessories")
  internal static let kidsClothing = ImageAsset(name: "Kids Clothing")
  internal static let kidsShoes = ImageAsset(name: "Kids Shoes")
  internal static let kids = ImageAsset(name: "Kids")
  internal static let menAccessories = ImageAsset(name: "Men Accessories")
  internal static let menClothing = ImageAsset(name: "Men Clothing")
  internal static let menShoes = ImageAsset(name: "Men Shoes")
  internal static let men = ImageAsset(name: "Men")
  internal static let womenAccessories = ImageAsset(name: "Women Accessories")
  internal static let womenClothing = ImageAsset(name: "Women Clothing")
  internal static let womenShoes = ImageAsset(name: "Women Shoes")
  internal static let women = ImageAsset(name: "Women")
  internal static let discountImage = ImageAsset(name: "discount_image")
  internal static let discountImage1 = ImageAsset(name: "discount_image1")
  internal static let discountImage2 = ImageAsset(name: "discount_image2")
  internal static let discountImage3 = ImageAsset(name: "discount_image3")
  internal static let discountImage4 = ImageAsset(name: "discount_image4")
  internal static let discountImage5 = ImageAsset(name: "discount_image5")
  internal static let discountImage6 = ImageAsset(name: "discount_image6")
  internal static let discountImageOne = ImageAsset(name: "discount_image_one")
  internal static let imageDiscountTwo = ImageAsset(name: "image_discount_two")
  internal static let images1 = ImageAsset(name: "images-1")
  internal static let images10 = ImageAsset(name: "images-10")
  internal static let images11 = ImageAsset(name: "images-11")
  internal static let images12 = ImageAsset(name: "images-12")
  internal static let images13 = ImageAsset(name: "images-13")
  internal static let images14 = ImageAsset(name: "images-14")
  internal static let images15 = ImageAsset(name: "images-15")
  internal static let images16 = ImageAsset(name: "images-16")
  internal static let images2 = ImageAsset(name: "images-2")
  internal static let images3 = ImageAsset(name: "images-3")
  internal static let images4 = ImageAsset(name: "images-4")
  internal static let images5 = ImageAsset(name: "images-5")
  internal static let images6 = ImageAsset(name: "images-6")
  internal static let images7 = ImageAsset(name: "images-7")
  internal static let images8 = ImageAsset(name: "images-8")
  internal static let images9 = ImageAsset(name: "images-9")
  internal static let images = ImageAsset(name: "images")
  internal static let logoImage = ImageAsset(name: "logo_image")
  internal static let metchickLogo = ImageAsset(name: "metchick_logo")
  internal static let tShirt1 = ImageAsset(name: "t-shirt1")
  internal static let tShirt2 = ImageAsset(name: "t-shirt2")
  internal static let tShirt3 = ImageAsset(name: "t-shirt3")
  internal static let tShirt4 = ImageAsset(name: "t-shirt4")
  internal static let tShirt5 = ImageAsset(name: "t-shirt5")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
