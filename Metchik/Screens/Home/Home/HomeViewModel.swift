//
//  MainCategoryViewModel.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private let homeViewUseCase: HomeViewUseCase

    private var cancellables = Set<AnyCancellable>()
    let coordinator: HomeTabCoordinatorProtocol
    
    @Published var offers: [Offer] = []
    @Published var categories: [String] = []
    @Published var subCategories: [String] = []
    @Published var products: [String: [Product]] = [:]
    @Published var selectedCategory: String = "" {
        didSet {
            homeViewUseCase.updateSelectedCategory(selectedCategory: selectedCategory)
        }
    }
    
    init(coordinator: HomeTabCoordinatorProtocol, homeViewUseCase: HomeViewUseCase) {
        self.coordinator = coordinator
        self.homeViewUseCase = homeViewUseCase
        bindUseCase()
    }
    
    private func bindUseCase() {
        homeViewUseCase.$offers
            .receive(on: DispatchQueue.main)
            .assign(to: &$offers)
        homeViewUseCase.$categories
            .receive(on: DispatchQueue.main)
            .assign(to: &$categories)  
        homeViewUseCase.$subCategories
            .receive(on: DispatchQueue.main)
            .assign(to: &$subCategories)
        homeViewUseCase.$products
            .receive(on: DispatchQueue.main)
            .assign(to: &$products)
        homeViewUseCase.$selectedCategory
            .receive(on: DispatchQueue.main)
            .assign(to: &$selectedCategory)
    }
    
}
extension HomeViewModel {
    func pressedViewAllButton(selectedSubCategory: String) {
        
        coordinator.showProductView(selectedCategory: selectedCategory,selectedSubCategory: selectedSubCategory)
    }
    
    func productItemPressed(product: Product) {
        
        coordinator.showDetails(product: product)
    }
    func pressedLeadingNavigationButton() {
        coordinator.showSubCategoryView(category: selectedCategory)
    }
    
    func pressedTrailingNavigationButton() {
        coordinator.showProfile()
    }
    
    func getProductItemViewModel(product: Product) -> ProductItemViewModel {
        ProductItemViewModel(product: product, coordinator: coordinator)
    }
}
