//
//  DiscountView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct DiscountView: View {
    
    @StateObject private var discountViewModel = DiscountViewModel()
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 20) {
                
                Text("The End of Season Sale is HERE! 🔥 Don’t miss the chance to shop all your Metchik Favorite at discount price with up to 50% OFF.Shop now ")
                
                Spacer().frame(height: 20)
                // Image Discount logo
                Image("discount_image")
                    .resizable()
                    .scaledToFit()
                
                Spacer().frame(height: 20)
                // Image
                ForEach(discountViewModel.discounts) { item in
                    VStack{
                        
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                        
                        VStack(spacing: 5) {
                            
                            Text("$\(String(format: "%.2f", item.oldPrice))")
                                .foregroundColor(.gray)
                                .strikethrough()
                            
                            Text("$\(String(format: "%.2f", item.newPrice))")
                                .foregroundColor(.gray)
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
        DiscountView()
    }
}
