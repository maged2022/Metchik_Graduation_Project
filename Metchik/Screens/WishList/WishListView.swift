//
//  WishListView.swift
//  Metchik
//
//  Created by Hassan on 05/05/2024.
//

import SwiftUI

struct WishListView: View {
    @StateObject var viewModel: WishListViewModel

    var body: some View {
        ScrollView {
            ForEach(viewModel.cartProducts,id: \.self) { cartProduct in
                CartAndWishListViewCell(
                    viewModel: CartAndWishListViewModelCell(
                        product: viewModel.getProduct(by: cartProduct),
                        cartProduct: cartProduct)
                )
            }
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        if let wishListViewModel = DependencyManager.shared.sharedContainer.resolve(WishListViewModel.self) {
            WishListView(viewModel: wishListViewModel)
        }
    }
}
