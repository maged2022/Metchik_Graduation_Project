//
//  SubCategorySectionView.swift
//  Metchik
//
//  Created by Hassan on 10/02/2024.
//

import SwiftUI

struct QuickSubCategoryView: View {
    @EnvironmentObject var vmod: HomeViewModel

    @State var sectionName = "new Arrivals"
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
                ForEach(vmod.products) { product in
                    ProductItemView(product: product) {
                        
                    }
                    
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
