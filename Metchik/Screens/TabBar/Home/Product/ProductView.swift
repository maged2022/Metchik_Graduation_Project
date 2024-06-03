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
        .animation(.spring())
        .padding(.horizontal,25)
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor )
        .navigationBarItems(
            trailing: searchButton
        )
        .navigationTitle(productViewModel.selectedSubCategory)
        .popup(isPresented: productViewModel.showAlert, content: {
            SnackBar(title: "Error!",
                     message: productViewModel.alertMessage,
                     buttonTitle: "OK",
                     onClick: {
                productViewModel.showAlert = false
            })
        })
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
            if let productViewModel = DependencyManager.shared.sharedContainer.resolve(ProductViewModel.self) {
                ProductView(productViewModel: productViewModel)
            }
        }
    }
}
