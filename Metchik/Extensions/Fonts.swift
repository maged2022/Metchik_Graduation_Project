//
//  Fonts.swift
//  Metchik
//
//  Created by Hassan on 10/02/2024.
//

import Foundation
import SwiftUI

extension Font {
    enum Poppins: String {
          case black = "Poppins-Black"
          case blackItalic = "Poppins-BlackItalic"
          case bold = "Poppins-Bold"
          case boldItalic = "Poppins-BoldItalic"
          case extraBold = "Poppins-ExtraBold"
          case extraBoldItalic = "Poppins-ExtraBoldItalic"
          case extraLight = "Poppins-ExtraLight"
          case extraLightItalic = "Poppins-ExtraLightItalic"
          case italic = "Poppins-Italic"
          case light = "Poppins-Light"
          case lightItalic = "Poppins-LightItalic"
          case medium = "Poppins-Medium"
          case mediumItalic = "Poppins-MediumItalic"
          case regular = "Poppins-Regular"
          case semiBold = "Poppins-SemiBold"
          case semiBoldItalic = "Poppins-SemiBoldItalic"
          case thin = "Poppins-Thin"
          case thinItalic = "Poppins-ThinItalic"
      }

      static func poppins(_ poppinsFont: Poppins, size: CGFloat) -> Font {
          guard let font = UIFont(name: poppinsFont.rawValue, size: size) else {
              fatalError("Error loading Poppins font: \(poppinsFont.rawValue)")
          }
          return Font(font)
      }
}
