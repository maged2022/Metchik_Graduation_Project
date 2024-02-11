//
//  CartView.swift
//  Metchik
//
//  Created by maged on 08/01/2024.
//

import SwiftUI

struct CartView: View {
    
     var productViewModel : ProductViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var totalPrice: Double = 0
//    var columns = [
//        GridItem(.fixed(10), spacing: 100),
//    ]
    
    var body: some View {
        VStack {
            VStack(spacing:1) {
                Text("METCHIK")
                    .bold()
                    .font(.system(size:20))
                    .padding(.top, 50)
                
                Text("Shopping Bag")
                    .bold()
                    .font(.system(size:20))
            }
            
            Divider()
            ScrollView{
                
                if productViewModel.basketProducts.count > 0 {
                    
                    LazyVGrid(columns: columns) {
                        ForEach(Array(productViewModel.basketProducts.enumerated()), id: \.element.id) { index, userSelection in
                            
                            BasketRowView(productViewModel: productViewModel, product: userSelection, index: index)
                            
                        }
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color.gray)
                        .padding(6)
                    
                    Text("Total Price:    \(String(format: "%.2f  L.E", productViewModel.totalPrice()))")
                        .bold()
                        .font(.system(size:20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)


                } else {
                    Text("Your Shopping Bag is currently empty")
                        .bold()
                        .font(.system(size:20))
                    
                    Button(action: {
                        
                        presentationMode.wrappedValue.dismiss() //dismiss the screen
                        
                    }, label: {
                        Text("Shop Now")
                            .foregroundColor(.black)
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.black, lineWidth: 1)
                                    .frame(width: 150, height: 30)
                            )
                            .padding()
                    })
                }
            }
            .navigationTitle(Text("My Cart"))
            .padding(.top)
        }
        .background(Color.gray
            .ignoresSafeArea()
            .opacity(0.2))
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        let productViewModel = ProductViewModel()
        productViewModel.basketProducts = [
            Product(id: "1", name: "Sample Product 1", images: ["discount_image2"], price: 50.0, discountPrice: 45.0),
            Product(id: "2", name: "Sample Product 2", images: ["discount_image1"], price: 30.0, discountPrice: 25.0),
            // Add more sample products as needed
        ]

        return NavigationView {
            CartView(productViewModel: productViewModel)
        }
    }
}
