//
//  CartPromoCodeSection.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI

struct CartPromoCodeSection: View {
    @EnvironmentObject var viewModel: CartViewModel
    @State var textFieldText: String = ""
    var body: some View {
        TextField(text: $textFieldText) {
            Text("Promo Code")
                .font(.poppins(.regular, size: 13))
                .foregroundColor(Asset.Colors.searchLabelColor.swiftUIColor)
        }
        .padding(.leading,5)
        .padding(15)
       
        .overlay(alignment:.trailing) {
            Button(action: {}, label: {
                Text("Apply")
                    .font(.poppins(.semiBold, size: 11))
                    .padding(.horizontal,14)
                    .padding(.vertical,7)
                    .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                    .background(Asset.Colors.secondaryButtonColor.swiftUIColor.cornerRadius(7))
                    .padding(.trailing,15)
            })
        }
        .background(Asset.Colors.backgroundSearchColor.swiftUIColor.cornerRadius(10))
    }
}

struct CartPromoCodeSection_Previews: PreviewProvider {
    static var previews: some View {
        if let cartViewModel = DependencyManager.shared.sharedContainer.resolve(CartViewModel.self) {
            
            CartPromoCodeSection()
                .environmentObject(cartViewModel)
        }
    }
}
