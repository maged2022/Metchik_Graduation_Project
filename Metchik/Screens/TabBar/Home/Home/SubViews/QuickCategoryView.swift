//
//  CategoryCardView.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import SwiftUI

struct QuickCategoryView: View {
    typealias Colors = Asset.Colors

    @EnvironmentObject var vmod: HomeViewModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vmod.categories,id: \.self) { category in
                        CapsuleButton(
                            title: category,
                            isSelected: (vmod.selectedCategory == category),
                            horizontalPadding: 14,
                            height: 30
                        ) {
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

        if let homeViewModel = DependencyManager.shared.sharedContainer.resolve(HomeViewModel.self) {
            QuickCategoryView()
            .environmentObject(homeViewModel)
        }
    }
}
