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
            VStack(alignment: .leading){
                Text("Welcome,")
                    .foregroundStyle(Color.themeColor.primaryLabelColor)
                    .font(.poppins(.bold, size: 25))
                Text("Our Fashions App")
                    .foregroundStyle(Color.themeColor.secondaryLabelColor)
                    .font(.poppins(.bold, size: 20))
            }
            .frame(maxWidth: .infinity)
            SearchBarView(searchText: .constant(""))
            
            OffersView()
            QuickCategoryView(categorys: mainCategoryViewModel.categories)
            .navigationTitle("Metchik")
        }
        .background(Color.themeColor.backgroundScreenColor
            .ignoresSafeArea()
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView(content: {
            HomeView()

        })
    }
}


