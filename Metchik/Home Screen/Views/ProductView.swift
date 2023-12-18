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
        GridItem(.flexible(),spacing: 15), // First column with flexible width
        GridItem(.flexible(),spacing: 15),
    ]

    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(productViewModel.products) { product in
                    NavigationLink(destination: ProductDetailView(selectedProduct: product)) {
                        ProductItemView(product: product)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            productViewModel.fetchProducts(for: selectedSubcategory)
        }
        .navigationBarTitle("Products")
    }
}
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView( selectedSubcategory: SubCategory(name: "Clothing"))
    }
}
