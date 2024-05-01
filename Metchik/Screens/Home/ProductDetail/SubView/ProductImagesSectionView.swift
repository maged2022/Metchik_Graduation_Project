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
            TabView {
                 ForEach(viewModel.productDetail.images, id: \.self) { imageUrl in
                     AsyncImage(url: imageUrl) { image in
                         image
                             .resizable()
                             .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 430)
                     } placeholder: {
                         ProgressView()
                     }
                     .tag(imageUrl)
                 }
             }
            .tabViewStyle(PageTabViewStyle())
            HStack {
                VirtualTryButtonView()
                
                Spacer()
                
                heartButton
            }
        }
    }
}

struct ProductImagesSectionView_Previews: PreviewProvider {
    static var previews: some View {
        if let homeCoordinator = DependencyManager.shared.sharedContainer.resolve(HomeTabCoordinatorProtocol.self) {
            let productDetailViewModel = ProductDetailViewModel(product: Product.mockData, coordinator: homeCoordinator)
            ProductImagesSectionView()
                .environmentObject(productDetailViewModel)
        }
    }
}

extension ProductImagesSectionView {
    var heartButton: some View {
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
