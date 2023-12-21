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
    
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: 10), // First column with flexible width
        GridItem(.flexible(),spacing: 10),
    ]
    
    var body: some View {
        ScrollView {
            HStack {
                SearchBarView(searchText: $productViewModel.searchText)
                Button {
                    // Filter
                } label: {
                    Text("Filter")
                        .foregroundColor(.gray)
                    
                }
                Rectangle()
                    .frame(width: 1, height: 20) // Adjust height as needed
                    .foregroundColor(.gray)
                
                Button {
                    // sort
                } label: {
                    Text("Sort")
                        .foregroundColor(.gray)
                        .padding(.trailing,5)
                }
            }
            .background(.gray.opacity(0.1))
            .padding(.horizontal)
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(productViewModel.products) { product in
                    NavigationLink(destination: ProductDetailView(selectedProduct: product)) {
                        ProductItemView(product: product, onBuutonTap: {
                            // When Add to Card button is tapped
                            // should go to login or register screen
                            
                        })
                    }
                }
            }
            .padding(.horizontal)
        }
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
