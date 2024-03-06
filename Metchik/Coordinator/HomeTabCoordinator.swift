//
//  HomeTabCoordinator.swift
//  Metchik
//
//  Created by Hassan on 05/03/2024.
//

import UIKit
import SwiftUI

protocol HomeCoordinatorProtocol: Coordinator {
    func showHome()
    func showDetails(product: Product)
}

class HomeTabCoordinator: NSObject, HomeCoordinatorProtocol {
    
    var router: Router

    init(router: Router) {
        self.router = router
    }
    
    lazy var homeViewController = UIHostingController(rootView: HomeView())
    
    func start() {
        showHome()
    }
    
    func showHome() {
        router.push(homeViewController)
    }
    
    func showDetails(product: Product) {
        
    }

}
