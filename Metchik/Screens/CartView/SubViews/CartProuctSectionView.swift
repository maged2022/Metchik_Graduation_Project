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
            VStack(spacing: 22) {
                ForEach(viewModel.cartProducts,id: \.self) { cartProduct in
                    CartAndWishListViewCell(
                        viewModel: CartAndWishListViewModelCell(
                            product: viewModel.getProduct(by: cartProduct),
                            cartProduct: cartProduct))
                }
            }
            //            .onDelete(perform: viewModel.deleteCartProduct)
        }
        .shadow(color: Color.gray.opacity(0.1), radius: 1, x: -1, y: -1)
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
