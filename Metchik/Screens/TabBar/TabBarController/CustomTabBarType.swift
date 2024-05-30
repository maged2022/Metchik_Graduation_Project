//
//  CustomTabBarType.swift
//  Metchik
//
//  Created by Hassan on 10/05/2024.
//

import UIKit

enum CustomTabBarType: Int, CaseIterable, Hashable {
    case home = 0
    case cart
    case wishList
    case profile
    
    private var title: String {
        switch self {
        case .home: return "Home"
        case .cart: return "Cart"
        case .wishList: return "Favorite"
        case .profile: return "Profile"
        }
    }
    
    private var icon: UIImage? {
        switch self {
        case .home: return UIImage(asset: Asset.Tabbar.home)?.withRenderingMode(.alwaysOriginal)
        case .cart: return UIImage(asset: Asset.Tabbar.cart)?.withRenderingMode(.alwaysOriginal)
        case .wishList: return UIImage(asset: Asset.Tabbar.favorite)?.withRenderingMode(.alwaysOriginal)
        case .profile: return UIImage(asset: Asset.Tabbar.profile)?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    private var selectedIcon: UIImage? {
        switch self {
        case .home: return UIImage(asset: Asset.Tabbar.homeSelected)?.withRenderingMode(.alwaysOriginal)
        case .cart: return UIImage(asset: Asset.Tabbar.cartSelected)?.withRenderingMode(.alwaysOriginal)
        case .wishList: return UIImage(asset: Asset.Tabbar.favoriteSelected)?.withRenderingMode(.alwaysOriginal)
        case .profile: return UIImage(asset: Asset.Tabbar.profileSelected)?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    var tabBarItem: UITabBarItem {
        let item = UITabBarItem(title: title, image: icon, selectedImage: selectedIcon)
        item.tag = self.rawValue
        return item
    }
}
