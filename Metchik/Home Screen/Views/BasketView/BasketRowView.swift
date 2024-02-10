//
//  BasketRowView.swift
//  Metchik
//
//  Created by maged on 08/01/2024.
//

import SwiftUI

struct BasketRowView: View {
    
    var productViewModel: ProductViewModel
    
    var product: Product
    var index: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(product.images[0])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110)
                .cornerRadius(10)
                .padding(.leading)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 5, y: 5)
                .shadow(color: .black.opacity(0.1), radius: 10, x: -5, y: -5)
            
            VStack (alignment: .leading, spacing: 3) {
                
                Text(product.name)
                    .font(.system(size: 15))
                    .bold()
                
                Text(String(format: "%.2f L.E", product.discountPrice))
                    .font(.system(size: 13))
                    .bold()
                
                HStack {
                    Text("Color:  Red ")
                        .font(.system(size: 13))
                        .bold()
                    
                    Spacer()
                    Button ( action: {
                        withAnimation {
                            productViewModel.removeProduct(index: index)

                        }
                        
                    }){
                        Image(systemName: "trash")
                            .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                            .padding(.horizontal)
                    }
                }
                
                Text("Size:  S")
                    .font(.system(size: 13))
                    .bold()

            }
            .padding(.bottom, 20)
            .frame(width: 250)
        }
    }
}

struct BasketRowView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: "1", name: "product_1", images: ["discount_image3"], price: 225.50, discountPrice: 125.14)
        let productViewModel = ProductViewModel()
        
        return BasketRowView(productViewModel: productViewModel, product: product, index: 0)
//            .previewLayout(.fixed(width: 300, height: 100))
//            .padding()
    }
}

