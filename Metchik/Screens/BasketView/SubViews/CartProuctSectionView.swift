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
            }
            .onDelete(perform: viewModel.deleteCartProduct)
        }
        .listStyle(PlainListStyle())
    }
}

struct CartProuctSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CartProuctSectionView()
            .environmentObject(CartViewModel())
        
    }
}
