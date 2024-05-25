//
//  ProductImagesSectionView.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI

struct ProductImagesSectionView: View {
    typealias Colors = Asset.Colors
    @State private var currentPage = 0
    @EnvironmentObject var viewModel: ProductDetailViewModel
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentPage) {
                ForEach(viewModel.productDetail?.images.indices ?? 1..<2, id: \.self) { index in
                    AsyncImage(url: viewModel.productDetail?.images[index]) { image in
                        image
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .tag(index)
                }
            }
            // Hide built-in page indicator
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            // Custom pagination indicator
            VStack {
                HStack(spacing: 13) {
                    ForEach(viewModel.productDetail?.images.indices ?? 1..<2, id: \.self) { index in
                        Circle()
                            .frame(width: 7, height: 7)
                            .foregroundColor(.white)
                        
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: index == currentPage ? 2 : 0)
                                    .frame(width: 15, height: 15)
                                
                            )
                            .scaleEffect(index == currentPage ? 1 : 0.9) // Enlarge current page indicator
                            .animation(.spring()) // Add animation
                            .onTapGesture {
                                currentPage = index // Update current page on tap
                            }
                    }
                }
                .padding(.bottom, 45)
            }
            
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
        Button(action: {
            viewModel.favoriteButtonPressed()
        }, label: {
            Image(uiImage:
                    viewModel.product.isFavorite ?  Asset.Icons.love.image : Asset.Icons.lovewhite.image
            )
                .resizable()
                .frame(width: 30,height: 30)
                .padding(15)
        })
        .padding(25)
        .padding(.bottom,25)
        .tag("1")
    }
}
