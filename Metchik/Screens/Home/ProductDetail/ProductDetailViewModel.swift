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
    private var productUseCase: ProductDetailRepositories = ProductDetailUseCase()
    private var cancellables = Set<AnyCancellable>()
    let product: Product
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
    
    init(product: Product) {
        self.product = product
        getProductdetail()
    }
    
    private func getProductdetail() {
        productUseCase.fetchProductDetail(by: product.id)
        productUseCase.getProductDetail()
            .sink {[weak self] productDetail in
                self?.productDetail = productDetail
            }
            .store(in: &cancellables)
    }
    
    private func getAvilableSizes () {
        productUseCase.getAvilableSizes()
            .sink { [weak self] sizes in
                self?.availableSizes = sizes
                if let firstSize = sizes.first {
                    self?.selectedSize = firstSize
                }
            }
            .store(in: &cancellables)
        
    }
    
    private func getAvilableColors () {
        productUseCase.getAvilableColors(forSize: selectedSize)
            .sink { [weak self] colors in
                self?.availableColors = colors
                if let firstColor = colors.first {
                    self?.selectedColor = firstColor
                }
            }
            .store(in: &cancellables)
    }
    
    private func getMaxAvilableProducts () {
        productUseCase.getMaxAvilableProducts(size: selectedSize, color: selectedColor)
            .sink { [weak self] maxAvilable in
                self?.maxAvailableProduct = maxAvilable
            }
            .store(in: &cancellables)
    }
    
    func getTotalPrice() -> Double {
        return product.price * Double(currentStepperValue)
    }
}
