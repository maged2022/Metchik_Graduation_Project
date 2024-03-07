//
//  MainCategoryViewModel.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private let offersUseCase: OffersRepositories = OffersUseCase.instance
    private let productUseCase: ProductRepositories = ProductUseCase.instance
    private var cancellables = Set<AnyCancellable>()
    let coordinator: HomeCoordinatorProtocol

    @Published var offers: [Offer] = []
    @Published var categories: [String] = []
    @Published var subCategories: [String] = [] {
        didSet {
            updateProducts()
        }
    }
    @Published var products: [String: [Product]] = [:]
    @Published var selectedCategory: String = "" {
        didSet {
            updateSubCategories()
        }
    }

    init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
        updateOffers()
        updateCategories()
    }

    private func updateOffers() {
        offersUseCase.getOffers()
            .receive(on: DispatchQueue.main)
            .assign(to: &$offers)
    }

    private func updateCategories() {
        productUseCase.getCategories()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] categories in
                self?.categories = categories
                if let firstCategory = categories.first {
                    self?.selectedCategory = firstCategory
                }
            }
            .store(in: &cancellables)
    }

    private func updateSubCategories() {
        productUseCase.getSubCategories(category: selectedCategory)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] subCategories in
                self?.subCategories = subCategories
            }
            .store(in: &cancellables)
    }

    private func updateProducts() {
        productUseCase.getProducts(category: selectedCategory, subCategories: subCategories)
            .sink { [weak self] product in
                self?.products = product
            }
            .store(in: &cancellables)
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
        coordinator.createProductItemViewModel(product: product)
    }
}
