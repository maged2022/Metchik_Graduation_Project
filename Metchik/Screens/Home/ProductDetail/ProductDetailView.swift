//
//  ProductDetailView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    typealias Colors = Asset.Colors
    @StateObject var productDetailViewModel : ProductDetailViewModel
    
    var body: some View {
        
        VStack {
           
            ProductImagesSectionView()
            VStack(alignment: .leading) {
                HStack {
                    ProductMetaView()
                    Spacer()
                    avaliableInStokView
                }
                HStack {
                    ProductSizeSectionView()
                    
                    ProductColorsView()

                }
                
                ProductDescriptionSectionView()
                
                AddToCartSectionView()
            }
            .padding(.vertical,20)
            .padding(.horizontal,25)
            .background(Colors.backgroundScreenColor.swiftUIColor
                .ignoresSafeArea()
                .cornerRadius(30)
            )
            .offset(y:-33)
        }
        .animation(.spring())
        .ignoresSafeArea()
        .background(Colors.backgroundScreenColor.swiftUIColor )
        .environmentObject(productDetailViewModel)
        .navigationBarItems(
            trailing:
                CartButtonView(cartViewModel: productDetailViewModel.getCartButtonViewModel())
        )
        .onDisappear {
            productDetailViewModel.productDetailOnDisapear()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            if let productDetailViewModel = DependencyManager.shared.sharedContainer
                .resolve(ProductDetailViewModel.self) {
                
                ProductDetailView(productDetailViewModel: productDetailViewModel)
                    .previewLayout(.fixed(width: 500, height: 1000))
            }
        })
       
    }
}

extension ProductDetailView {
    
    var avaliableInStokView: some View {
        VStack(spacing: 12) {
            StepperView(
                maxAvailableProduct: $productDetailViewModel.maxAvailableProduct,
                currentStepperValue: $productDetailViewModel.currentStepperValue)
            Text("Avaliable in stok")
                .font(.poppins(.semiBold, size: 11))
        }
    }
}
