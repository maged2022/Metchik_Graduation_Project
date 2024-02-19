//
//  ProductItemView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductItemView: View {
    
    let product: Product
    var onBuutonTap: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(product.images[0])
                    .resizable()
                    .frame(height: 170)
                    .cornerRadius(15)
                    .scaledToFill()
                
                Text(product.name)
                    .font(.poppins(.semiBold, size: 14))
                    .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
               
                Text(product.shortDescription)
                    .font(.poppins(.regular, size: 11))
                    .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)

                HStack {
                    Text("\(String(format: "%.2f", product.price)) L.E")
                        .font(.poppins(.regular, size: 11))
                        .foregroundColor(Colors.secondaryLabelColor.swiftUIColor)
                        .strikethrough()
                    
                    Text("\(String(format: "%.2f", product.discountPrice)) L.E")
                        .font(.poppins(.semiBold, size: 14))
                        .foregroundColor(Colors.primaryLabelColor.swiftUIColor)
                }
            }
            
            Button {
                onBuutonTap()
            } label: {

                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 8,height: 8)
                    .foregroundColor(Colors.primaryButtonColor.swiftUIColor)
                    .scaledToFit()
                    .font(.poppins(.semiBold, size: 8))
                    .frame(width: 20,height: 20)
                    .background(Colors.secondaryButtonColor.swiftUIColor
                    )
                    .cornerRadius(10)
                    .padding(15)

            }
        }
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: Product(id: "1", name: "T-Shirt",
                                         images: ["t-shirt1"], price: 23.44, discountPrice: 16.44), onBuutonTap: {
        })
    }
}