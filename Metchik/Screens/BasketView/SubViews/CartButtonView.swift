//
//  CartButtonView.swift
//  Metchik
//
//  Created by maged on 07/01/2024.
//

import SwiftUI

struct CartButtonView: View {
    typealias Colors = Asset.Colors

    var numberOfProducts: Int // users has in the cart.
    
    var body: some View {
        ZStack(alignment: .topTrailing) {

            Colors.backgroundScreenColor.swiftUIColor
            .frame(width: 30,height: 30)
            .cornerRadius(30)
            .shadow(color: .black.opacity(0.1), radius: 10)
            .overlay {
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 13, height: 13)
            }
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.poppins(.semiBold, size: 7))
                    .foregroundColor(Colors.primaryButtonColor.swiftUIColor)
                    .frame(width: 13, height: 13,alignment: .bottom)
                    .background(Colors.secondaryButtonColor.swiftUIColor)
                    .cornerRadius(13)
            }
        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(numberOfProducts: 1)
    }
}
