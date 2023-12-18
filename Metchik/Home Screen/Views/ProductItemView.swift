//
//  ProductItemView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
            
            Text(product.name)
                .font(.headline)
                .padding(.top, 8)
            
            Text("$\(String(format: "%.2f", product.price))")
                .foregroundColor(.gray)
                .padding(.top, 4)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: Product(name: "T-Shirt", imageName: "t-Shirt", price: 23.44))
    }
}
