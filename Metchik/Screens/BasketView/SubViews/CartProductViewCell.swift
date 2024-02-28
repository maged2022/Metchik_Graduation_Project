//
//  CartProductViewCell.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI

struct CartProductViewCell: View {
    typealias Colors = Asset.Colors
    @EnvironmentObject var viewModel: CartViewModel

    var product: Product
//    var index: Int
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 6) {
            product.mainImage
                .resizable()
                .scaledToFill()
                .frame(width: 80,height: 80)
                .cornerRadius(10)

            VStack(alignment: .leading,spacing: 2) {
                Text(product.name)
                    .font(.poppins(.semiBold, size: 14))
                
                Text(product.shortDescription)
                    .font(.poppins(.regular, size: 11))
                    .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
                    .padding(.bottom,12)
                Text("\(String(format: "%.2f", product.price)) L.E")
                    .font(.poppins(.bold, size: 14))
                    .padding(.bottom,4)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack {
                Button {
                } label: {
                    Image(systemName: "minus")
                }
                Text("1")
                Button {
                } label: {
                    Image(systemName: "plus")
                }
            }
            .font(.poppins(.regular, size: 14))
            .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
            .padding(.vertical,5)
            .padding(.horizontal,12)
            .background(Colors.backgroundSearchColor.swiftUIColor)
            .cornerRadius(30)
            .padding(.leading,10)
            .padding(.trailing,5)
           
        }
        .padding(10)
        .cornerRadius(13)
    }
        
}

struct CartProductViewCell_Previews: PreviewProvider {
    static var previews: some View {
        return CartProductViewCell(product: Product.mockData)
            .environmentObject(CartViewModel())

    }
}
