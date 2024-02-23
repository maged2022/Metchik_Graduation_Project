//
//  CategoryCardView.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import SwiftUI

struct QuickCategoryView: View {
    @EnvironmentObject var vmod: HomeViewModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vmod.categories,id: \.self) { category in
                        Text(category)
                            .font(.poppins(.bold, size: 13))
                            .foregroundColor(
                                ((vmod.selectedCategory == category) ?
                                 Colors.primaryButtonColor : Colors.secondaryButtonColor).swiftUIColor
                               )
                            .frame(width: 80, height: 30)
                            .background( capsuleBackground(for: category))
                            .onTapGesture {
                                vmod.selectedCategory = category
                            }
                    }
                }
            }
            
        }
    }
    
    @ViewBuilder
    func capsuleBackground(for category: String) -> some View {
        if vmod.selectedCategory == category {
            Capsule()
                .fill( Color.black)
        } else {
            Capsule()
                .stroke( Colors.borderCategoryColor.swiftUIColor, lineWidth: 2)
        }
    }

}

struct QuickCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCategoryView()
            .environmentObject(HomeViewModel())
    }
}
