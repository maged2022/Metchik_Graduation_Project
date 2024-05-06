//
//  ProductDetailViewModel.swift
//  Metchik
//
//  Created by Hassan on 23/02/2024.
//

import Foundation
import SwiftUI
import Combine

class ProductDetailViewModel: ObservableObject {
    private var productUseCase: ProductDetailRepositories = ProductDetailUseCase.instance
    private var cartUseCase: CartRepositories = CartUseCase.instance
    let product: Product
    let coordinator: HomeTabCoordinatorProtocol
    @Published var productDetail: ProductDetail = .mockData {
        didSet {
            getAvilableSizes()
        }
    }
    @Published var selectedSize: ProductSizes = .l {
        didSet {
            getAvilableColors()
        }
    }
    @Published var availableSizes: [ProductSizes] = [.m, .l, .xl]
    @Published var selectedColor: Color = .blue {
        didSet {
            getMaxAvilableProducts()
        }
    }
    @Published var availableColors: [Color] = [.blue]
    @Published var maxAvailableProduct: Int = 1 {
        didSet {
            currentStepperValue = 1
        }
    }
    @Published var currentStepperValue: Int = 1
    
    init(product: Product, coordinator: HomeTabCoordinatorProtocol) {
        self.product = product
        self.coordinator = coordinator
        getProductdetail()
    }
    
    private func getProductdetail() {
        productUseCase.fetchProductDetail(by: product.id)
        productUseCase.getProductDetail {[weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let productDetail):
                        self?.productDetail = productDetail
                    case .failure(let failure):
                        print(failure)
                    }
                }
            }
    }
    
    private func getAvilableSizes () {
        productUseCase.getAvilableSizes { [weak self] sizes in
                self?.availableSizes = sizes
                if let firstSize = sizes.first {
                    self?.selectedSize = firstSize
                }
            }
    }
    
    private func getAvilableColors () {
        productUseCase.getAvilableColors(forSize: selectedSize) { [weak self] colors in
                self?.availableColors = colors
                if let firstColor = colors.first {
                    self?.selectedColor = firstColor
                }
            }
    }
    
    private func getMaxAvilableProducts () {
        productUseCase.getMaxAvilableProducts(size: selectedSize, color: selectedColor) { [weak self] maxAvilable in
                self?.maxAvailableProduct = maxAvilable
            }
    }
    
    func getTotalPrice() -> Double {
        return product.price * Double(currentStepperValue)
    }
    
    func addToCart() {
        cartUseCase.saveCartProduct(
            product: product,
            size: selectedSize,
            color: selectedColor,
            count: currentStepperValue)
    }
}
extension ProductDetailViewModel {
    func getCartButtonViewModel() -> CartButtonViewModel {
        CartButtonViewModel(coordinator: coordinator)
    }
    
    func pressedTryItButton(personImage: UIImage?) {
        coordinator.showVirtualTry(personImage: personImage, productImageURL: product.imageURL)
    }
}
