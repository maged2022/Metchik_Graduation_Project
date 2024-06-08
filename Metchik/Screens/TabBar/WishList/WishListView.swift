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
        VStack(alignment: .leading,spacing: 15) {
            titleLabel
                .frame(maxWidth: .infinity,alignment: .leading)
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
            .padding(.horizontal,-25)
           
        }
        .padding(25)
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor )
        .onAppear {
            viewModel.showTabBar()
        }
        .popup(isPresented: viewModel.showAlert, content: {
            SnackBar(type: .error,
                     message: viewModel.alertMessage,
                     icon: .favorite,
                     onClick: {
                viewModel.showAlert = false
            })
        })
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        if let wishListViewModel = DependencyManager.shared.sharedContainer.resolve(WishListViewModel.self) {
            WishListView(viewModel: wishListViewModel)
        }
    }
}

extension WishListView {
    var titleLabel: some View {
        Text("Wish List")
            .font(.poppins(.bold, size: 18))
            .foregroundColor(Asset.Colors.primaryLabelColor.swiftUIColor)
    }
}
