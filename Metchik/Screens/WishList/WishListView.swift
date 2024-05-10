//
//  WishListView.swift
//  Metchik
//
//  Created by Hassan on 05/05/2024.
//

import SwiftUI

struct WishListView: View {
    @StateObject var viewModel: WishListViewModel
    @State private var swipeToDeleteIndex: Int?

    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(Array(viewModel.wishListProducts.enumerated()), id: \.element) { index, wishListProduct in
                    SwipeToDeleteEffect(index: index, swipeToDeleteIndex: $swipeToDeleteIndex, onDelete: {
                        viewModel.removeButtonPressed(index: index)
                      },content: {
                          WishListViewCell(
                              viewModel: WishListViewModelCell(
                                  coordinator: viewModel.coordinator,
                                  product: viewModel.getProduct(by: wishListProduct)
                              )
                          )
                      })
                }
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
