//
//  CustomTabBarViewModel.swift
//  Metchik
//
//  Created by Hassan on 10/05/2024.
//

import UIKit
import Combine

protocol CustomTabBarViewModelInterface: AnyObject {
    var tabBarIsHidden: Bool { get set }
    var tabBarIsHiddenPublisher: Published<Bool>.Publisher { get }
    
    var selectedTab: CustomTabBarType { get set }
    var selectedTabPublisher: Published<CustomTabBarType>.Publisher { get }

    var viewControllers: [UIViewController] { get set }
    
}

class CustomTabBarViewModel: ObservableObject, CustomTabBarViewModelInterface {
    
    static let shared = CustomTabBarViewModel()
    
    @Published var tabBarIsHidden: Bool = false
    var tabBarIsHiddenPublisher: Published<Bool>.Publisher { $tabBarIsHidden }
    
    @Published var selectedTab: CustomTabBarType = .home
    var selectedTabPublisher: Published<CustomTabBarType>.Publisher { $selectedTab }
    
    var viewControllers: [UIViewController] = []

}
