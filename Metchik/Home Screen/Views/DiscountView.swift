//
//  DiscountView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct DiscountView: View {
    
    @StateObject private var productViewModel = ProductViewModel()
    let imageLogoString: String
    let imageDiscountString: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                DiscountImageView(imageDiscountString: imageLogoString)
                DiscountImageView(imageDiscountString: imageDiscountString)
                
                
                Spacer().frame(height: 1)
                
                ForEach(productViewModel.products) { item in
                    VStack{
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                        VStack(spacing: 5) {
                            Text("$\(String(format: "%.2f", item.price))")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .strikethrough()
                            Text("$\(String(format: "%.2f", item.discountPrice))")
                                .font(.title2)
                                .foregroundColor(.red)
                                .bold()
                            
                        }
                    }
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
        }
        .onAppear {
            productViewModel.fetchProducts(for: SubCategory(name: "man"))
        }
    }
}

struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountView(imageLogoString: "discount_image_one", imageDiscountString: "images-2")
    }
}


