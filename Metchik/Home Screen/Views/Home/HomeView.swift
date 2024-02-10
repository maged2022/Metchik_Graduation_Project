//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var mainCategoryViewModel = MainCategoryViewModel()
    
    var body: some View {
        
        ScrollView {
            DiscountView(imageLogoString: "discount_image_one", imageDiscountString: "images-4")
            ScrollView(.horizontal, showsIndicators: true) {
                HStack () {
                    ForEach(mainCategoryViewModel.categories) { category in
                        NavigationLink {
                            SubCategoryView(categorie: category.name)
                        } label: {
                            CategoryCardView(category: category)
                                .frame(height: 150)
                                .padding()
                        }
                    }
                }
            }
            .navigationTitle("Metchik")
        }
        .background(Color.gray
            .ignoresSafeArea()
            .opacity(0.2))
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}


