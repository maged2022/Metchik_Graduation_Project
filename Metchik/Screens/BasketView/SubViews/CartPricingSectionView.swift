//
//  CartPricingSectionView.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI

struct CartPricingSectionView: View {
    typealias Colors = Asset.Colors
    @EnvironmentObject var viewModel: CartViewModel

    var body: some View {
            HStack {
                Text("Total (\(viewModel.products.count) item) :")
                    .font(.poppins(.semiBold, size: 16))
                    .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
                Spacer()
                Text("\(String(format: "%.2f", viewModel.calculateTotalPrice())) L.E")
                    .font(.poppins(.semiBold, size: 20))
            }
    }
}

struct CartPricingSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CartPricingSectionView()
            .environmentObject(CartViewModel())
        
    }
}
