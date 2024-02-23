//
//  SubCategorySectionView.swift
//  Metchik
//
//  Created by Hassan on 10/02/2024.
//

import SwiftUI

struct QuickSubCategoryView: View {
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
        QuickSubCategoryView()
            .environmentObject(HomeViewModel())

    }
}

struct CardSubCategoriesView: View {
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
                    
                } label: {
                    Text("View All")
                        .font(.poppins(.bold, size: 11))
                        .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
                }
            }
            HStack {
                ForEach(products.prefix(2)) { product in
                        ProductItemView(product: product) {
                            
                        }
                    }
            }
        }
    }
}
