//
//  CartProuctSectionView.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI

struct CartProuctSectionView: View {
    @EnvironmentObject var viewModel: CartViewModel

    var body: some View {
        List {
            ForEach(viewModel.cartProducts,id: \.self) { cartProduct in
                CartProductViewCell(
                    viewModel: CartProductViewModelCell(
                        product: viewModel.getProduct(by: cartProduct),
                        cartProduct: cartProduct))
                    .background(Asset.Colors.backgroundScreenColor.swiftUIColor )
            }
            .onDelete(perform: viewModel.deleteCartProduct)
        }
        .tint(Asset.Colors.backgroundScreenColor.swiftUIColor)
        .listStyle(PlainListStyle())
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor )
    }
}

struct CartProuctSectionView_Previews: PreviewProvider {
    static var previews: some View {
        if let cartViewModel = DependencyManager.shared.sharedContainer.resolve(CartViewModel.self) {
            
            CartProuctSectionView()
                .environmentObject(cartViewModel)
        }
    }
}
