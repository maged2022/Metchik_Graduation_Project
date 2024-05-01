//
//  HomeTabCoordinator.swift
//  Metchik
//
//  Created by Hassan on 05/03/2024.
//

import UIKit
import SwiftUI
import Swinject

protocol HomeTabCoordinatorProtocol: Coordinator {
    func showHome()
    func showSubCategoryView(category: String)
    func showProductView(selectedCategory: String,selectedSubCategory: String)
    func showDetails(product: Product)
    func createProductItemViewModel(product: Product) -> ProductItemViewModel
    func showProfile()
    func showCart()
    func showVirtualTry(personImage: UIImage?, productImageURL: URL?)
    func createCartButtonViewModel() -> CartButtonViewModel
}

class HomeTabCoordinator: NSObject, HomeTabCoordinatorProtocol {
    
    let router: Router
    let coordinator: TabBarCoordinatorProtocol
    private let resolver : Resolver

    init(router: Router, coordinator: TabBarCoordinatorProtocol, resolver: Resolver) {
        self.router =  router
        self.coordinator = coordinator
        self.resolver = resolver
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
    
    func showVirtualTry(
        personImage: UIImage?,
        productImageURL: URL?
    ) {
        guard let personImage = personImage else {
            fatalError("personImage error ")
        }
        let virtualTryUseCase = VirtualTryUseCase()
        let viewModel = VirtualTryViewModel(
            personImage: personImage,
            productImageURL: productImageURL,
            coordinator: self,
            virtualTryUseCase: virtualTryUseCase)
        let virualTry = VirtualTryView(virtualTryViewModel: viewModel)
        let virualTryViewController = UIHostingController(rootView: virualTry)
        router.push(virualTryViewController)
    }

}
