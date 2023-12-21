//
//  DiscountView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct DiscountView: View {
    
    @StateObject private var discountViewModel = DiscountViewModel()
    let imageLogoString: String
    let imageDiscountString: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Image(imageLogoString)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 15)
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: -15)
                
                Image(imageDiscountString)
                    .frame(maxWidth: .infinity)
                
                Spacer().frame(height: 1)
                
                ForEach(discountViewModel.discounts) { item in
                    VStack{
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                        VStack(spacing: 5) {
                            Text("$\(String(format: "%.2f", item.oldPrice))")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .strikethrough()
                            Text("$\(String(format: "%.2f", item.newPrice))")
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
    }
}

struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountView(imageLogoString: "discount_image_one", imageDiscountString: "images-2")
    }
}
