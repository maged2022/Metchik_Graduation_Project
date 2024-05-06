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
        ScrollView {
            ForEach(viewModel.cartProducts,id: \.self) { cartProduct in
                CartAndWishListViewCell(
                    viewModel: CartAndWishListViewModelCell(
                        product: viewModel.getProduct(by: cartProduct),
                        cartProduct: cartProduct))
            }
//            .onDelete(perform: viewModel.deleteCartProduct)
        }
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
