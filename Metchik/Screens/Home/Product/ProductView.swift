//
//  ProductView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductView: View {
    
    @ObservedObject var productViewModel = ProductViewModel()
    var selectedCategory: String
    var selectedSubCategory: String
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: 15),
        GridItem(.flexible(),spacing: 0)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(productViewModel.products) { product in
                    NavigationLink {
                        NavigationLazyView(
                            ProductDetailView( productDetailViewModel: ProductDetailViewModel(product: product)))
                    } label: {
                        ProductItemView(product: product, onBuutonTap: {
                            
                        })
                    }
                }
            }
        }
        .padding(.horizontal,25)
        .navigationBarItems(
            trailing:
                Button(action: {
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .padding(.trailing)
                })
        )
        .onAppear {
            productViewModel.getProducts(category: selectedCategory, subCategories: selectedSubCategory)
        }
        .navigationBarTitle(selectedSubCategory)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductView(selectedCategory: "Men", selectedSubCategory: "Shoes")
        }
    }
}
