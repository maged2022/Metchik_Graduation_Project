//
//  ProductImagesSectionView.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI

struct ProductImagesSectionView: View {
    typealias Colors = Asset.Colors

    @EnvironmentObject var viewModel: ProductDetailViewModel
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Asset.Images.discountImage2.swiftUIImage
                .resizable()
                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 430).tag("0")
            
            Button(action: {}, label: {
                Image(systemName: "heart")
                
                    .frame(width: 30,height: 30)
                    .aspectRatio(contentMode: .fill)
                    .background(Colors.primaryButtonColor.swiftUIColor
                        .cornerRadius(15)
                    )
            })
            .padding(25)
            .padding(.bottom,25)
            .tag("1")
            
        }
    }
}

struct ProductImagesSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let homeCoordinator = HomeTabCoordinator(router: router)
        let productDetailViewModel = ProductDetailViewModel(product: Product.mockData, coordinator: homeCoordinator)
        ProductImagesSectionView()
            .environmentObject(productDetailViewModel)
    }
}
