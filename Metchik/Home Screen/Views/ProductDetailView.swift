//
//  ProductDetailView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductDetailView: View {
    var selectedProduct: Product
    
    var body: some View {
        // Display details about the selected product
        VStack {
            Text(selectedProduct.name)
                .font(.title)
                .padding()
            
            Image(selectedProduct.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text("$\(String(format: "%.2f", selectedProduct.price))")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()
            
            Text("Description: Add your description here...")
                .padding()
        }
        .navigationBarTitle(selectedProduct.name)
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(selectedProduct: Product(name: "product Name", imageName: "product ImageName", price: 142.36))
    }
}
