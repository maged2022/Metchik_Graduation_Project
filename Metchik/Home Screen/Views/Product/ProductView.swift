//
//  ProductView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductView: View {
    
    @ObservedObject var productViewModel = ProductViewModel()
    var selectedSubcategory: SubCategory
    @State private var isBasketViewPresented = false
    
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: 15), // First column with flexible width
        GridItem(.flexible(),spacing: 10),
    ]
    
    var body: some View {
        ScrollView {
            HStack {
                QuickCategoryView(categorys: [Category(name: "shoes"), Category(name: "jacket"), Category(name: "jeans"), Category(name: "dress")])
            }
            Text("Shoes")
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.poppins(.bold, size: 18))
                .foregroundColor(.themeColor.primaryLabelColor)
            
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(productViewModel.products) { product in
                    NavigationLink(destination: ProductDetailView(selectedProduct: product, productViewModel: productViewModel)) {
                        ProductItemView(product: product, onBuutonTap: {
                            // When Add to Card button is tapped
                            // should go to login or register screen
                            
                        })
                    }
                }
            }
        }
        .padding(.horizontal,25)
        .navigationBarItems(trailing:
                                
                                Button(action: {
            isBasketViewPresented = true
        }) {
            //            BasketButtonView(numberOfProducts: cartmanager.cartProducts.count)
            BasketButtonView(numberOfProducts: productViewModel.basketProducts.count)
                .foregroundColor(.black)
                .padding(.leading)
        }
        )
        
        .sheet(isPresented: $isBasketViewPresented, content: {
            BasketView(productViewModel: productViewModel)
        })
        .onAppear {
            productViewModel.fetchProducts(for: selectedSubcategory)
        }
        .navigationBarTitle(selectedSubcategory.name)
    }
}
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView( selectedSubcategory: SubCategory(name: "Clothing"))
    }
}
