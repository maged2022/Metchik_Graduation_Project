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
        case .home: "Home"
        case .cart: "Cart"
        case .wishList: "Favorite"
        case .profile: "Profile"
        }
    }
    
    private var icon: UIImage? {
        switch self {
        case .home: UIImage(named: "tabbar/home")?.withRenderingMode(.alwaysOriginal)
        case .cart: UIImage(named: "tabbar/cart")?.withRenderingMode(.alwaysOriginal)
        case .wishList: UIImage(named: "tabbar/favorite")?.withRenderingMode(.alwaysOriginal)
        case .profile: UIImage(named: "tabbar/profile")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    private var selectedIcon: UIImage? {
        switch self {
        case .home: UIImage(named: "tabbar/home-selected")?.withRenderingMode(.alwaysOriginal)
        case .cart: UIImage(named: "tabbar/cart-selected")?.withRenderingMode(.alwaysOriginal)
        case .wishList: UIImage(named: "tabbar/favorite-selected")?.withRenderingMode(.alwaysOriginal)
        case .profile: UIImage(named: "tabbar/profile-selected")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    var tabBarItem: UITabBarItem {
        let item = UITabBarItem(title: title, image: icon, selectedImage: selectedIcon)
        item.tag = self.rawValue
        return item
    }
}
