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
                            .foregroundStyle(vmod.selectedCategory == category ? Colors.primaryButtonColor.swiftUIColor : Colors.secondaryButtonColor.swiftUIColor)
                            .frame(width: 80,height: 30)
                            .background(
                                (vmod.selectedCategory == category ? Color.black : .white)
                            )

                            .clipShape(Capsule())
//                            .background{
//                                Capsule()
//                                .stroke(style: .init())
//                                .foregroundColor(Colors.borderCategoryColor.swiftUIColor)
//                            
//                            }
                            .onTapGesture {
                                vmod.selectedCategory = category
                            }
                    }
                }
            }
            
        }
    }
}

struct QuickCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCategoryView()
            .environmentObject(HomeViewModel())
    }
}
