//
//  DiscountView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct DiscountView: View {
    
    @StateObject private var discountViewModel = DiscountViewModel()
    let description: String = "The End of Season Sale is HERE! 🔥🔥 Don’t miss the chance to shop all your Metchik Favorites at discounted prices with up to 50% OFF. Shop now 🛍"
    @State var compressDescription: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text(description)
                        .font(.title2)
                        .lineLimit(compressDescription ? nil : 2)
                    Button {
                        withAnimation(.easeInOut) {
                            compressDescription.toggle()
                        }
                    } label: {
                        Text( compressDescription ? "Show less" : "Read more" )
                            .foregroundColor(.blue)
                            .underline()
                    }
                }
                
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
