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
    private var cancellables: [String: AnyCancellable] = [:]
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
        self.cancellables["Productdetail"]?.cancel()
        let cancellable = AnyCancellable(productUseCase.getProductDetail()
            .sink {[weak self] productDetail in
                DispatchQueue.main.async {
                    self?.productDetail = productDetail
                }
            })
        self.cancellables["Productdetail"] = cancellable
    }
    
    private func getAvilableSizes () {
        self.cancellables["AvilableSizes"]?.cancel()
        let cancellable = AnyCancellable(productUseCase.getAvilableSizes()
            .sink { [weak self] sizes in
                self?.availableSizes = sizes
                if let firstSize = sizes.first {
                    self?.selectedSize = firstSize
                }
            })
        self.cancellables["AvilableSizes"] = cancellable
    }
    
    private func getAvilableColors () {
        self.cancellables["AvilableColors"]?.cancel()
        let cancellable = AnyCancellable(productUseCase.getAvilableColors(forSize: selectedSize)
            .sink { [weak self] colors in
                self?.availableColors = colors
                if let firstColor = colors.first {
                    self?.selectedColor = firstColor
                }
            })
        self.cancellables["AvilableColors"] = cancellable
    }
    
    private func getMaxAvilableProducts () {
        self.cancellables["MaxAvilableProducts"]?.cancel()
        let cancellable = AnyCancellable(productUseCase.getMaxAvilableProducts(size: selectedSize, color: selectedColor)
            .sink { [weak self] maxAvilable in
                self?.maxAvailableProduct = maxAvilable
            })
        self.cancellables["MaxAvilableProducts"] = cancellable
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
        coordinator.createCartButtonViewModel()
    }
    
    func pressedTryItButton(personImage: UIImage?) {
        coordinator.showVirtualTry(personImage: personImage, productImageURL: product.imageURL)
    }
}
