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
        getProductdetail(by: product.id)
    }
    
    private func getProductdetail(by id : String) {
        productUseCase.getProductDetail(by: id)
            .sink {[weak self] productDetail in
//                print(" productUseCase.getProductDetail(by: id) = \(productDetail)")
            self?.productDetail = productDetail
        }
        .store(in: &cancellables)
    }
    
    private func getAvilableSizes () {
        availableSizes = productDetail.productAttribute.map { $0.sizes}
        if let firstSize = availableSizes.first {
            selectedSize = firstSize
        }
    }
    
    private func getAvilableColors () {
        guard let sizeAttribute = productDetail.productAttribute
            .filter({ $0.sizes == selectedSize })
            .first else {return}
        availableColors = sizeAttribute.colors
        if let firstColor = availableColors.first {
            selectedColor = firstColor
        }
    }
    
    private func getMaxAvilableProducts () {
        guard let sizeAttribute = productDetail.productAttribute
            .filter({ $0.sizes == selectedSize })
            .first else {return}
        let indexedColors = sizeAttribute.colors.enumerated()
        if let (colorIndex, _) = indexedColors.first(where: { $0.element == selectedColor }) {
            maxAvailableProduct = sizeAttribute.avaliableInStok[colorIndex]
        }
    }
    
    func getTotalPrice() -> Double {
        return product.price * Double(currentStepperValue)
    }
}
