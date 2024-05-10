//
//  CartProuctSectionView.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI

struct CartProuctSectionView: View {
    @EnvironmentObject var viewModel: CartViewModel
    @State private var swipeToDeleteIndex: Int?

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 22) {
                
                ForEach(Array(viewModel.cartProducts.enumerated()), id: \.element) { index, cartProduct in
                    SwipeToDeleteEffect(index: index, swipeToDeleteIndex: $swipeToDeleteIndex, onDelete: {
                        viewModel.deleteCartProduct(index: index)
                    },content: {
                        CartProductViewCell(
                            viewModel: CartProductViewModelCell(
                                product: viewModel.getProduct(by: cartProduct),
                                cartProduct: cartProduct))
                    })
                }
            }
        }
        .onAppear {
            viewModel.showTabBar()
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
