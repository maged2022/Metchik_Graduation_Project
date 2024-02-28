//
//  ProductView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductView: View {
    
    @StateObject var productViewModel: ProductViewModel

    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: 15),
        GridItem(.flexible(),spacing: 0)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(productViewModel.products) { product in
                    ProductItemView(product: product, onBuutonTap: { })
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
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductView(productViewModel: ProductViewModel(selectedCategory: "Men", selectedSubCategory: "Shoes"))
        }
    }
}
