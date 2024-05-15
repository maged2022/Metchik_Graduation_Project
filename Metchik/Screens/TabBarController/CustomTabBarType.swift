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
        case .home: return UIImage(named: "tabbar/home")?.withRenderingMode(.alwaysOriginal)
        case .cart: return UIImage(named: "tabbar/cart")?.withRenderingMode(.alwaysOriginal)
        case .wishList: return UIImage(named: "tabbar/favorite")?.withRenderingMode(.alwaysOriginal)
        case .profile: return UIImage(named: "tabbar/profile")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    private var selectedIcon: UIImage? {
        switch self {
        case .home: return UIImage(named: "tabbar/home-selected")?.withRenderingMode(.alwaysOriginal)
        case .cart: return UIImage(named: "tabbar/cart-selected")?.withRenderingMode(.alwaysOriginal)
        case .wishList: return UIImage(named: "tabbar/favorite-selected")?.withRenderingMode(.alwaysOriginal)
        case .profile: return UIImage(named: "tabbar/profile-selected")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    var tabBarItem: UITabBarItem {
        let item = UITabBarItem(title: title, image: icon, selectedImage: selectedIcon)
        item.tag = self.rawValue
        return item
    }
}
