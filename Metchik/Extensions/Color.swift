//
//  Color.swift
//  CryptoCoinApp
//
//  Created by s on 30/09/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let themeColor = ThemeColor()
    static let launchScreenColor = LaunchScreenColor()
}

struct ThemeColor {
    let accentColor = Color("AccentColor")
    let backgroundColor = Color("BackgroundColor")
    let greenColor = Color("GreenColor")
    let redColor = Color("RedColor")
    let secondaryTextColor = Color("SecondaryTextColor")
    let primaryLabelColor = Color("PrimaryLabelColor")
    let secondaryLabelColor = Color("SecondaryLabelColor")
    let primaryButtonColor = Color("PrimaryButtonColor")
    let secondaryButtonColor = Color("SecondaryButtonColor")
    let backgroundScreenColor = Color("BackgroundScreenColor")
    let backgroundSearchColor = Color("BackgroundSearchColor")
    let searchLabelColor = Color("SearchLabelColor")
    let borderCategoryColor = Color("BorderCategoryColor")
    
}

struct LaunchScreenColor {
    let launchBackgroundColor = Color("LaunchBackgroundColor")
    let launchAccentColor = Color("LaunchAccentColor")
}
