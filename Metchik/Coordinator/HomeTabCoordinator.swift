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
    func showSubCategoryView(category: String)
    func showProductView(selectedCategory: String, selectedSubCategory: String)
    func showDetails(product: Product)
    func showVirtualTry(personImage: UIImage?, productImageURL: URL?)
    func showProfile()
    func showCart()
    func showTabBar()
    func showSearchView()
    func showFilterView()
}

class HomeTabCoordinator: NSObject, HomeTabCoordinatorProtocol {
    
    let router: Router
    private let tabBarCoordinator: TabBarCoordinatorProtocol
    private let resolver : Resolver

    init(router: Router, tabBarCoordinator: TabBarCoordinatorProtocol, resolver: Resolver) {
        self.router =  router
        self.tabBarCoordinator = tabBarCoordinator
        self.resolver = resolver
        
    }
    
    func start() {
        showHome()
    }
    
    private func showHome() {
        let useCase = HomeViewUseCase()
        let homeViewModel = HomeViewModel(coordinator: self, homeViewUseCase: useCase)
        let homeViewController = UIHostingController(rootView: HomeView(homeViewModel: homeViewModel))
        router.push(homeViewController)
    }
    
    func showSubCategoryView(category: String) {
        let subCategoryViewModel = SubCategoryViewModel(
            subCategorUseCase: .init(category: category),
            coordinator: self
        )
        let subCategoryView = SubCategoryView(subCategoryViewModel: subCategoryViewModel)
        let subCategoryViewController = UIHostingController(rootView: subCategoryView)
        router.push(subCategoryViewController)
        tabBarCoordinator.hideTabBar()
        
    }
    
    func showProductView(selectedCategory: String, selectedSubCategory: String) {
        let productViewModel = ProductViewModel(
            selectedCategory: selectedCategory,
            selectedSubCategory: selectedSubCategory,
            coordinator: self)
        let productViewController = UIHostingController(rootView: ProductView(productViewModel: productViewModel))
        router.push(productViewController)
        tabBarCoordinator.hideTabBar()

    }
    
    func showSearchView() {
        let searchUseCase = SearchUseCase()
        let searchViewModel = SearchViewModel(coordinator: self, searchUseCase: searchUseCase)
        let searchViewController = UIHostingController(rootView: SearchView(viewModel: searchViewModel))
        router.push(searchViewController)
        tabBarCoordinator.hideTabBar()
    }
    func showFilterView() {
        let filterViewController = UIHostingController(rootView: FilterView())
        router.push(filterViewController)
        tabBarCoordinator.hideTabBar()
    }
    
    func showDetails(product: Product) {
        let productDetailViewModel = ProductDetailViewModel(
            productDetailViewUseCase: .init(product: product),
            coordinator: self
        )
        let productDetailView = ProductDetailView(productDetailViewModel: productDetailViewModel)
        let productDetailViewController = UIHostingController(rootView: productDetailView)
        router.push(productDetailViewController)
        tabBarCoordinator.hideTabBar()

    }
    
    func showVirtualTry(
        personImage: UIImage?,
        productImageURL: URL?
    ) {
        guard let personImage = personImage else {
            return
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
        tabBarCoordinator.hideTabBar()

    }
    
    func showProfile() {
        tabBarCoordinator.showProfile()
    }
    
    func showCart() {
        router.popToRoot(animated: false)
        tabBarCoordinator.showCart()
    }
    func showTabBar() {
        tabBarCoordinator.showTabBar()
    }
}
