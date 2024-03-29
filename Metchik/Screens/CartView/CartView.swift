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
            
            CartProuctSectionView()
            
            CartPromoCodeSection()
            
            CartPricingSectionView()
            
            proceedButton
        }
        .padding(.bottom,25)
        .padding(.horizontal,25)
        .navigationTitle("My Cart")
        .background(Colors.backgroundScreenColor.swiftUIColor )
        .environmentObject(viewModel)
        .navigationBarItems(
            leading: BackButton(),
            trailing: CartButtonView(cartViewModel: viewModel.getCartButtonViewModel()))

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
    var proceedButton: some View {
        Button(action: { 
            
        }, label: {
            Text("Proceed to Checkout")
                .font(.poppins(.semiBold, size: 16))
                .foregroundStyle(Colors.primaryButtonColor.swiftUIColor)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Colors.secondaryButtonColor.swiftUIColor)
                )
        })
    }
}
