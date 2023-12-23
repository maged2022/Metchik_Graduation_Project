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
        VStack {
            Image(product.imageName)
                .resizable()
                .frame(height: 170)
                .cornerRadius(10)
            
            Text(product.name)
                .font(.headline)
            
            HStack {
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .strikethrough()
                
                Text("$\(String(format: "%.2f", product.discountPrice))")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
            
            
            Button {
                // add to card
                onBuutonTap()
            } label: {
                Text("ADD TO CART")
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .foregroundColor(.black)
                    .lineLimit(1) // Ensure the text stays within one line
                    .minimumScaleFactor(0.5)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            // Solve Conflict between navigationLink tapped && Button tapped
            .contentShape(Rectangle())
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: Product(name: "T-Shirt", imageName: "t-shirt1", price: 23.44, discountPrice: 16.44), onBuutonTap: {
        })
    }
}
