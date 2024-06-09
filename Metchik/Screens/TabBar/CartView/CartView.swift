//
//  CartView.swift
//  Metchik
//
//  Created by maged on 08/01/2024.
//

import SwiftUI

struct CartView: View {
    typealias Colors = Asset.Colors
    @StateObject var viewModel : CartViewModel
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 15) {
            
            titleLabel
            
            CartProuctSectionView()
                .padding(.horizontal,-25)

            CartPromoCodeSection()
            
            CartPricingSectionView()
            
            proceedButton
        }
        .padding(25)
        .background(Colors.backgroundScreenColor.swiftUIColor )
        .environmentObject(viewModel)
        .onAppear {
            viewModel.showTabBar()
        }
        .popup(isPresented: viewModel.showAlert, content: {
            SnackBar(type: .success,
                     message: viewModel.alertMessage,
                     icon: .cart,
                     onClick: {
                viewModel.showAlert = false
            })
        })

    }
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        return NavigationView {
            if let cartViewModel = DependencyManager.shared.sharedContainer.resolve(CartViewModel.self) {
                CartView(viewModel: cartViewModel)
            }
        }
    }
}

extension CartView {
    
    var titleLabel: some View {
        Text("My Cart")
            .font(.poppins(.bold, size: 18))
            .foregroundColor(Asset.Colors.primaryLabelColor.swiftUIColor)
    }
    
    var proceedButton: some View {
        Button(action: {
            
            viewModel.pressedCheckOutButton()
        },
               label: {
            Text("Proceed to Checkout")
                .font(.poppins(.semiBold, size: 16))
                .foregroundStyle(Colors.primaryButtonColor.swiftUIColor)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(
                            Colors.secondaryButtonColor
                                .swiftUIColor
                                .opacity(viewModel.isCheckoutActive ? 0.6 : 1) )
                )
                .padding(.bottom,50)
        })
        .disabled(viewModel.isCheckoutActive)
    }
}
