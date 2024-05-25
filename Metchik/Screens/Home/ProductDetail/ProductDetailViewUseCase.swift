//
//  ProductDetailViewUseCase.swift
//  Metchik
//
//  Created by Hassan on 26/05/2024.
//

import SwiftUI
import Combine

class ProductDetailViewUseCase {
    
    private var productDetailUseCase: ProductDetailRepositories = ProductDetailUseCase.instance
    private var cartUseCase: CartRepositories = CartUseCase.instance
    private var wishListUseCase: WishListRepositories = WishListUseCase.instance
    private var cancellables = Set<AnyCancellable>()
    
    let product: Product
    @Published var productPulish: Product
    @Published var productDetail: ProductDetail? {
        didSet {
            getAvilableSizes()
        }
    }
    @Published var selectedSize: ProductSizes? {
        didSet {
            getAvilableColors()
        }
    }
    @Published var availableSizes: [ProductSizes] = []
    @Published var selectedColor: Color? {
        didSet {
            getMaxAvilableProducts()
        }
    }
    @Published var availableColors: [Color] = []
    @Published var maxAvailableProduct: Int = 1
    @Published var currentStepperValue: Int = 1

    init (product:Product) {
        self.product = product
        self.productPulish = self.product
        bindProductDetail()
        bindFavoriteValue()
    }

}
// Mark:- productDetailUseCase
extension ProductDetailViewUseCase {
    
    func fetchProductDetail(by id : String) {
        productDetailUseCase.fetchProductDetail(by: id)
    }
    
    func bindProductDetail() {
        productDetailUseCase.productDetailPublisher.sink {[weak self] result in
            switch result {
            case .success(let productDetail):
                self?.productDetail = productDetail
            case .failure(let failure):
                print("productDetailUseCase.productDetailPublisher.sink ")
            }
        }.store(in: &cancellables)
        
    }

    func getAvilableSizes() {
        availableSizes = productDetail?.productAttribute.map {$0.sizes} ?? []
    }
    
    func updateSelectedSize(selectedSize: ProductSizes?) {
        self.selectedSize = selectedSize
    }
    
    func getAvilableColors() {
        availableColors = productDetail?.productAttribute
            .first {$0.sizes == selectedSize }
            .map {$0.colors} ?? []
    }
    
    func updateSelectedColor(selectedColor: Color?) {
        self.selectedColor = selectedColor
    }
    
    func getMaxAvilableProducts() {
        guard let sizeAttribute = productDetail?.productAttribute
            .filter({ $0.sizes == selectedSize })
            .first,
              let colorIndex = sizeAttribute.colors.firstIndex(where: { $0 == selectedColor }) else {
            
            return
        }
        maxAvailableProduct = sizeAttribute.avaliableInStok[colorIndex]
        
    }
    
    func updateCurrentStepperValue(value: Int) {
        currentStepperValue = value
    }
    func productDetailOnDisapear() {
        productDetailUseCase.productDetailOnDisapear()
    }
}

// Mark:- CartUseCase
extension ProductDetailViewUseCase {

    func addToCart() {
        guard let selectedSize = selectedSize, let selectedColor = selectedColor else {return}
        cartUseCase.saveCartProduct(
            product: product,
            size: selectedSize,
            color: selectedColor,
            count: currentStepperValue)
    }
    
}

// Mark:- FavoriteUseCase
extension ProductDetailViewUseCase {

    func bindFavoriteValue() {
        wishListUseCase.wishListProductsPublisher.sink { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    let state = success.filter({ $0.productID == self.product.id}).isEmpty
                    self.productPulish.isFavorite = !state
                }
            case .failure(let failure):
                print(failure)
            }
        }
        .store(in: &cancellables)
    }
    
    func favoriteButtonPressed() {
        wishListUseCase.favoriteButtonPressed( productID: product.id) { result in
            switch result {
            case .success:
                self.wishListUseCase.updateWishListProducts()
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
