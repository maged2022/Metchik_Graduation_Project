//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct MainCategoryView: View {
    
    @State private var mainCategoryViewModel = MainCategoryViewModel()
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                ForEach(mainCategoryViewModel.categories) { category in
                    NavigationLink {
                        SubCategoryView(categorie: category.name)
                    } label: {
                        CategoryCardView(category: category)
                    }
                }
            }
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


