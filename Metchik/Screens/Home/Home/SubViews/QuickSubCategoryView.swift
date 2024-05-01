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
        VStack {
            ForEach(vmod.subCategories,id: \.self) { subCategorie in
                if let products = vmod.products[subCategorie] , products.count > 1 {
                    CardSubCategoriesView(sectionName: subCategorie, products: products)
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
    @State var sectionName: String
    @State var products: [Product]
    
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
                        .font(.poppins(.bold, size: 18))
                        .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
                        .padding(.trailing, 20)
                }
            }
            HStack() {
                ForEach(products.prefix(2)) { product in
                    let productItemViewModel = vmod.getProductItemViewModel(product: product)
                    ProductItemView(productItemViewModel: productItemViewModel)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.trailing)
        }
    }
}
