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
                    let productItemViewModel = productViewModel.getProductItemViewModel(product: product)
                    ProductItemView(productItemViewModel: productItemViewModel)
                }
            }
        }
        .animation(.spring)
        .padding(.horizontal,25)
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor )
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackButton(), trailing: searchButton )
        .navigationTitle(productViewModel.selectedSubCategory)
    }
    
    private var searchButton: some View {
            Button(action: {
            }, label: {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing)
                    .foregroundColor(Asset.Colors.primaryLabelColor.swiftUIColor)
            })
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let navigationController = UINavigationController()
            let router = AppRouter(navigationController: navigationController)
            let homeCoordinator = HomeTabCoordinator(router: router)
            let productViewModel = ProductViewModel(selectedCategory: "Men", selectedSubCategory: "Shoes", coordinator: homeCoordinator)
            ProductView(productViewModel: productViewModel)
        }
    }
}
