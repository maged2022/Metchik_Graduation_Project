//
//  SubCategorySectionView.swift
//  Metchik
//
//  Created by Hassan on 10/02/2024.
//

import SwiftUI

struct QuickSubCategoryView: View {
    typealias Colors = Asset.Colors
    @EnvironmentObject var vmod: HomeViewModel
    var body: some View {
        LazyVStack {
            ForEach(vmod.subCategories,id: \.0) { subCategorie in
                if let products = vmod.products[subCategorie.1] , products.count > 1 {
                    CardSubCategoriesView(sectionName: subCategorie.1, products: products)
                }
            }
        }
    }
}

struct QuickSubCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        if let homeViewModel = DependencyManager.shared.sharedContainer.resolve(HomeViewModel.self) {
            QuickSubCategoryView()
                .environmentObject(homeViewModel)
        }
    }
}

struct CardSubCategoriesView: View {
    typealias Colors = Asset.Colors
    @EnvironmentObject var vmod: HomeViewModel
    var sectionName: String
    var products: [Product]
    
    var body: some View {
        VStack {
            HStack {
                Text(sectionName)
                    .font(.poppins(.bold, size: 18))
                    .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
                Spacer()
                Button {
                    vmod.pressedViewAllButton(selectedSubCategory: sectionName)
                } label: {
                    Text("View All")
                        .font(.poppins(.bold, size: 17))
                        .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
                        .padding(.trailing, 20)
                }
            }
            .padding(.horizontal)
            HStack {
                
                    ProductItemView(productItemViewModel: vmod.getProductItemViewModel(product: products[0]))
                        .frame(maxWidth: .infinity)     
                    ProductItemView(productItemViewModel: vmod.getProductItemViewModel(product: products[1]))
                        .frame(maxWidth: .infinity)
                
            }
            .padding(.trailing)
        }
    }
}
