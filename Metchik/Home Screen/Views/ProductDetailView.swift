//
//  ProductDetailView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductDetailView: View {
    var selectedProduct: Product
    
    
    // Mock data for colors and sizes
    let availableColors = ["AccentColor", "RedColor", "GreenColor"]
    let availableSizes = ["S", "M", "L", "XL"]
    
    @State private var selectedColor: String = ""
    @State private var selectedSize: String = ""
    
    
    
    let description: String = " Premium 100% cotton fabric for softness and breathability Classic 🔥🔥 crew neckline and short sleeves for a timeless look Available in multiple vibrant colors to suit your style Sizes available: XS, S, M, L, XL, XXL 🛍"
    
    @State var compressDescription: Bool = false
    
    
    var body: some View {
        // Display details about the selected product
        ScrollView {
            //new code
            
            Image(selectedProduct.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(selectedProduct.name)
                    .font(.title)
                
                HStack {
                    Text("$\(String(format: "%.2f", selectedProduct.price))")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .strikethrough()
                    
                    Text("$\(String(format: "%.2f", selectedProduct.discountPrice))")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            
            Divider()
                .frame(width: 200, height: 2, alignment: .leading)
                .background(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            
            // Color Selector Table
            VStack(alignment: .leading) {
                HStack {
                    Text("Color:  ")
                        .font(.title2)
                    
                    Text("\(selectedColor)")
                        .font(.title2)
                }
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(availableColors, id: \.self) { color in
                            Button(action: {
                                selectedColor = color
                            }) {
                                ZStack {
                                    Image(selectedProduct.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                    
                                        .overlay(
                                            Circle()
                                                .fill(Color(color)
                                                    .opacity(selectedColor == color ? 0.5 : 0.3))
                                        )
                                    
                                        .overlay(
                                            Circle().stroke(selectedColor == color ? Color.black : Color.clear, lineWidth: 1)
                                        )
                                }
                            }
                            
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .padding()
            
            Divider()
                .frame(width: 200, height: 2, alignment: .leading)
                .background(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // Size Selector Table
            VStack(alignment: .leading) {
                HStack {
                    Text("Size:  ")
                        .font(.title2)
                    
                    Text("\(selectedSize)")
                        .font(.title2)
                        .bold()
                }
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(availableSizes, id: \.self) { size in
                            Button(action: {
                                selectedSize = size
                            }) {
                                Text(size)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(selectedSize == size ? Color.blue : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .padding()
            
            Divider()
                .frame(width: 200, height: 2, alignment: .leading)
                .background(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // Description about product
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
            .padding()
            // end of scroll view
        }
        
        .navigationBarTitle(selectedProduct.name)
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(selectedProduct: Product(name: "product Name", imageName: "discount_image4", price: 142.36, discountPrice: 122.36))
    }
}
