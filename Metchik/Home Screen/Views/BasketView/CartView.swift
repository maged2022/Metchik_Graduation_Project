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
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 15) {
            Text("My Cart")
                .font(.poppins(.bold, size: 18))
            
            ScrollView {
                LazyVStack {
                    ForEach(Array(productViewModel.basketProducts.enumerated()), id: \.element.id) { index, userSelection in
                        CartRowView(productViewModel: productViewModel, product: userSelection, index: index)
                        if !(index == productViewModel.basketProducts.count - 1) {
                            Divider()
                        }
                    }
                }
            }
            .padding(.bottom,20)
            
            VStack {
                HStack{
                    Text("Subtotal:")
                        .font(.poppins(.semiBold, size: 14))
                    Spacer()
                    Text("$483")
                        .font(.poppins(.semiBold, size: 20))
                }
                Divider()
                HStack{
                    Text("Shipping:")
                        .font(.poppins(.semiBold, size: 14))
                    Spacer()
                    Text("$17")
                        .font(.poppins(.semiBold, size: 20))
                }
                Divider()
                HStack{
                    Text("BagTotal:")
                        .font(.poppins(.semiBold, size: 14))
                    Spacer()
                    Text("(3 item)")
                        .font(.poppins(.regular, size: 14))
                        .foregroundStyle(Color.themeColor.secondaryLabelColor)
                    Text("$500")
                        .font(.poppins(.semiBold, size: 20))
                }
            }
            .foregroundStyle(Color.themeColor.primaryLabelColor)
            .padding(.horizontal,20)
            .padding(.vertical,15)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke()
            )
            .padding(.bottom,50)
            
            Button(action: {}, label: {
                Text("Proceed to Checkout")
                    .font(.poppins(.semiBold, size: 16))
                    .foregroundStyle(Color.themeColor.primaryButtonColor)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.themeColor.secondaryButtonColor)
                    )
            })
        }
        .padding(.bottom,50)
        .padding(.horizontal,25)
        .background(Color.themeColor.backgroundScreenColor )
        .ignoresSafeArea(.all,edges: .bottom)
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
