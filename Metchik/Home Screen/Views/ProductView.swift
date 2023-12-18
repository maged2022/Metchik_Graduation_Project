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
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
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
