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
            ForEach(viewModel.cartProducts,id: \.id) { cartProduct in
                CartProductViewCell(cartProduct: cartProduct)
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
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let cartCoordinator = TabBarCoordinator(router: router)
        let cartViewModel = CartViewModel(coordinator: cartCoordinator)

        CartProuctSectionView()
            .environmentObject(cartViewModel)
        
    }
}
