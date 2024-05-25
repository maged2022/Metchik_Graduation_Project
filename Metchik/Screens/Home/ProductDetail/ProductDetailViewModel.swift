//
//  ProductDetailViewModel.swift
//  Metchik
//
//  Created by Hassan on 23/02/2024.
//

import SwiftUI
import Combine

class ProductDetailViewModel: ObservableObject {
    private var productDetailViewUseCase: ProductDetailViewUseCase
    private var cancellables = Set<AnyCancellable>()
    @Published var product: Product
    let coordinator: HomeTabCoordinatorProtocol
    @Published var productDetail: ProductDetail?
    @Published var selectedSize: ProductSizes? {
        didSet {
            productDetailViewUseCase.updateSelectedSize(selectedSize: selectedSize)
        }
    }
    @Published var availableSizes: [ProductSizes] = []
    @Published var selectedColor: Color? {
        didSet {
            productDetailViewUseCase.updateSelectedColor(selectedColor: selectedColor)
        }
    }
    @Published var availableColors: [Color] = []
    @Published var maxAvailableProduct: Int = 1 {
        didSet {
            currentStepperValue = 1
        }
    }
    @Published var currentStepperValue: Int = 1 {
        didSet {
            productDetailViewUseCase.updateCurrentStepperValue(value: currentStepperValue)
        }
    }
    
    init(product: Product, coordinator: HomeTabCoordinatorProtocol) {
        self.product = product
        self.coordinator = coordinator
        self.productDetailViewUseCase = .init(product:product)
        bindUseCase()
    }
    
    private func bindUseCase() {
        productDetailViewUseCase.fetchProductDetail(by: product.id)
        productDetailViewUseCase.$productDetail
            .receive(on: DispatchQueue.main)
            .assign(to: &$productDetail)
        productDetailViewUseCase.$availableSizes .receive(on: DispatchQueue.main)
            .sink { [weak self] sizes in
                self?.availableSizes = sizes
                if let firstSize = sizes.first {
                    self?.selectedSize = firstSize
                }
            }.store(in: &cancellables)
        productDetailViewUseCase.$availableColors .receive(on: DispatchQueue.main)
            .sink { [weak self] colors in
                self?.availableColors = colors
                if let firstColor = colors.first {
                    self?.selectedColor = firstColor
                }
            }.store(in: &cancellables)
        productDetailViewUseCase.$maxAvailableProduct
            .receive(on: DispatchQueue.main)
            .assign(to: &$maxAvailableProduct)
        productDetailViewUseCase.$productPulish
            .receive(on: DispatchQueue.main)
            .assign(to: &$product)
    }
    
    func favoriteButtonPressed() {
        productDetailViewUseCase.favoriteButtonPressed()
    }
    
    func addToCart() {
        productDetailViewUseCase.addToCart()
    }
    
    func getTotalPrice() -> Double {
        return product.price * Double(currentStepperValue)
    }
    
}
extension ProductDetailViewModel {
    func getCartButtonViewModel() -> CartButtonViewModel {
        CartButtonViewModel(coordinator: coordinator)
    }
    
    func pressedTryItButton(personImage: UIImage?) {
        coordinator.showVirtualTry(personImage: personImage, productImageURL: product.imageURL)
    }
    
    func productDetailOnDisapear() {
        productDetailViewUseCase.productDetailOnDisapear()
    }
}
