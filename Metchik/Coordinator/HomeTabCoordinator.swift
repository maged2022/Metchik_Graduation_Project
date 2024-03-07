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
    func showSubCategoryView(category: String)
    func showProductView(selectedCategory: String,selectedSubCategory: String)
    func showDetails(product: Product)
    func createProductItemViewModel(product: Product) -> ProductItemViewModel
    func showProfile()
    func showCart()
    func createCartButtonViewModel() -> CartButtonViewModel
}

class HomeTabCoordinator: NSObject, HomeCoordinatorProtocol {
    
    var router: Router
    let coordinator: TabBarCoordinatorProtocol
    init(router: Router,
         coordinator: TabBarCoordinatorProtocol = TabBarCoordinator(
            router: AppRouter(navigationController: UINavigationController()))) {
        self.router = router
        self.coordinator = coordinator
    }
    
    func start() {
        showHome()
    }
    
    func showHome() {
        let homeViewModel = HomeViewModel(coordinator: self)
        let homeViewController = UIHostingController(rootView:HomeView(homeViewModel: homeViewModel))
        router.push(homeViewController)
    }
    
    func showProductView(selectedCategory: String,selectedSubCategory: String) {
                      
        let productViewModel = ProductViewModel(
            selectedCategory: selectedCategory,
            selectedSubCategory: selectedSubCategory,
            coordinator: self)
        let productViewController = UIHostingController(rootView: ProductView(productViewModel: productViewModel))
                            
        router.push(productViewController)
    }
    
    func showSubCategoryView(category: String) {
        let subCategoryViewModel = SubCategoryViewModel(category: category, coordinator: self)
        let subCategoryView = SubCategoryView(subCategoryViewModel: subCategoryViewModel)
        let subCategoryViewController = UIHostingController(rootView: subCategoryView)
        router.push(subCategoryViewController)
    }
    
    func showProfile() {
        coordinator.showProfile()
    }
    
    func showDetails(product: Product) {
        let productDetailViewModel = ProductDetailViewModel(product: product, coordinator: self)
        let productDetailView = ProductDetailView(productDetailViewModel: productDetailViewModel)
        let productDetailViewController = UIHostingController(rootView: productDetailView)
        router.push(productDetailViewController)
    }
    
    func createProductItemViewModel(product: Product) -> ProductItemViewModel {
        let productItemViewModel = ProductItemViewModel(
            product: product,
            coordinator: self)
           return productItemViewModel
    }

    func createCartButtonViewModel() -> CartButtonViewModel {
        CartButtonViewModel(coordinator: self)
    }
    
    func showCart() {
        router.popToRoot()
        coordinator.showCart()
    }
}
