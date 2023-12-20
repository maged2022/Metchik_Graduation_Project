//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct MainCategoryView: View {
    
    @State private var mainCategoryViewModel = MainCategoryViewModel()
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(mainCategoryViewModel.categories) { category in
                    NavigationLink {
                        SubCategoryView(categorie: category.name)
                    } label: {
                        CategoryCardView(category: category)
                            .frame(height: 170)
                    }
                }
            }
            Spacer().frame( height: 30)
            Divider()
                .frame(width: 250, height: 2)
                .background(.blue)
            Spacer().frame( height: 30)
            DiscountView()
                .navigationTitle("Metchik 👕👚")
        }
        .background(Color.gray
            .ignoresSafeArea()
            .opacity(0.2))
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainCategoryView()
    }
}


