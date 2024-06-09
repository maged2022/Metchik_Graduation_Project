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
        .popup(isPresented: productDetailViewModel.showAuthAlert, content: {
            SnackBar(type: .authError,
                     message: productDetailViewModel.alertMessage,
                     icon: .favorite,
                     onClick: {
                productDetailViewModel.showAuthAlert = false
            }, onClickLogin: {
                productDetailViewModel.showAuthAlert = false
                productDetailViewModel.pressLoginButton()
            })
        })
        .popup(isPresented: productDetailViewModel.showAlert, content: {
            SnackBar(type: .error,
                     message: productDetailViewModel.alertMessage,
                     icon: .favorite,
                     onClick: {
                productDetailViewModel.showAlert = false
            })
        })
        .popup(isPresented: productDetailViewModel.showSuccessPopup, content: {
            SnackBar(type: .success,
                     message: productDetailViewModel.alertMessage,
                     icon: .cart,
                     onClick: {
                productDetailViewModel.showSuccessPopup = false
            })
        })
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
                .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
        }
    }
}
