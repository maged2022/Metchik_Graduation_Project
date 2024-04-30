//
//  HomeAssembly.swift
//  Metchik
//
//  Created by Hassan on 09/03/2024.
//

import Swinject

class HomeAssemply: Assembly {
    
    // MARK: - Properties
    private let sharedContainer: Container
    // MARK: - Lifecycle
    init(sharedContainer: Container) {
        self.sharedContainer = sharedContainer
    }
    // MARK: - Functions
    func assemble(container: Swinject.Container) {
        sharedContainer.register(HomeViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(HomeTabCoordinatorProtocol.self)
            else {fatalError("error resolver HomeTabCoordinatorProtocol")}
            return HomeViewModel(coordinator: coordinator)
        }
        sharedContainer.register(ProductDetailViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(HomeTabCoordinatorProtocol.self)
            else {fatalError("error resolver HomeTabCoordinatorProtocol")}
            return ProductDetailViewModel(product: Product.mockData, coordinator: coordinator)
        }
        sharedContainer.register(ProductItemViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(HomeTabCoordinatorProtocol.self)
            else {fatalError("error resolver HomeTabCoordinatorProtocol")}
            return ProductItemViewModel(product: Product.mockData, coordinator: coordinator)
        }
        sharedContainer.register(ProductViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(HomeTabCoordinatorProtocol.self)
            else {fatalError("error resolver HomeTabCoordinatorProtocol")}
            return ProductViewModel(selectedCategory: "Men", selectedSubCategory: "Shoes", coordinator: coordinator)
        } 
        sharedContainer.register(SubCategoryViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(HomeTabCoordinatorProtocol.self)
            else {fatalError("error resolver HomeTabCoordinatorProtocol")}
            return SubCategoryViewModel(category: "Men", coordinator: coordinator)
        }
        sharedContainer.register(VirtualTryViewModel.self) { resolver in
            guard let coordinator = resolver.resolve(HomeTabCoordinatorProtocol.self)
            else {fatalError("error resolver HomeTabCoordinatorProtocol")}
            let image = Asset.Images.discountImage3.image
            let virtualTryUseCase = VirtualTryUseCase()
            return VirtualTryViewModel(
                personImage: image,
                productImageURL: Product.mockData.imageURL,
                coordinator: coordinator,
                virtualTryUseCase: virtualTryUseCase
            )
        }
    }
}
