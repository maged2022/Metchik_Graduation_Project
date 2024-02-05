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
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: -5)
                
                Image(imageDiscountString)
                    .frame(maxWidth: .infinity)
                
                Spacer().frame(height: 1)
                
                ForEach(discountViewModel.discounts) { item in
                    VStack{
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                        VStack(spacing: 5) {
                            Text("\(String(format: "%.2f", item.oldPrice)) L.E")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .strikethrough()
                            Text("\(String(format: "%.2f", item.newPrice)) L.E")
                                .font(.title2)
                                .foregroundColor(.red)
                                .bold()
                            
                        }
                    }
                    .padding(.horizontal)
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
