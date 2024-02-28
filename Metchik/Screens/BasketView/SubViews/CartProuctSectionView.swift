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
            LazyVStack {
                ForEach(viewModel.products) { product in
                    CartProductViewCell(product: product)
                    //                        if !(index == productViewModel.basketProducts.count - 1) {
                    //                            Divider()
                    //                        }
                }
            }
        }
        .padding(.bottom,20)
    }
}

struct CartProuctSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CartProuctSectionView()
            .environmentObject(CartViewModel())
        
    }
}
