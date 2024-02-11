//
//  CartRowView.swift
//  Metchik
//
//  Created by maged on 08/01/2024.
//

import SwiftUI

struct CartRowView: View {
    
    var productViewModel: ProductViewModel
    
    var product: Product
    var index: Int
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 6) {
            Image(product.images[0])
                .resizable()
                .scaledToFill()
                .frame(width: 80,height: 80)
                .cornerRadius(10)

            VStack(alignment: .leading,spacing: 2) {
                Text("Roller Rabbit")
                    .font(.poppins(.semiBold, size: 14))
                
                Text("Vado Odelle Dress")
                    .font(.poppins(.regular, size: 11))
                    .foregroundStyle(Color.themeColor.secondaryLabelColor)
                    .padding(.bottom,12)
                Text("$198.00")
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
            .foregroundStyle(Color.themeColor.primaryLabelColor)
            .padding(.vertical,5)
            .padding(.horizontal,12)
            .background(Color.themeColor.backgroundSearchColor)
            .cornerRadius(30)
            .padding(.leading,10)
            .padding(.trailing,5)
           
        }
        .padding(10)
        .cornerRadius(13)
    }
        
}

struct CartRowView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: "1", name: "product_1", images: ["discount_image3"], price: 225.50, discountPrice: 125.14)
        let productViewModel = ProductViewModel()
        
        return CartRowView(productViewModel: productViewModel, product: product, index: 0)

    }
}

