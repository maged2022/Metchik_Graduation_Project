//
//  CartTabCoordinator.swift
//  Metchik
//
//  Created by Hassan on 05/03/2024.
//

import UIKit
import SwiftUI

class CartTabCoordinator: NSObject, Coordinator {
        
    let viewModel = CartViewModel()
    var router: Router

    init(router: Router) {
        self.router = router

    }
    lazy var cartViewController = UIHostingController(rootView:  CartView(viewModel: self.viewModel))

    func start() {
        router.push(cartViewController)
    }
    
}
