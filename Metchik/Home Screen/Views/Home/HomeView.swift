//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var homeViewModel = HomeViewModel()
    
    var body: some View {
        
        ScrollView {
            VStack(spacing:25) {
                VStack(spacing:20) {
                    HStack {
                        VStack(alignment:.leading){
                            Text("Welcome,")
                                .foregroundStyle(Color.themeColor.primaryLabelColor)
                                .font(.poppins(.bold, size: 25))
                            Text("Our Fashions App")
                                .foregroundStyle(Color.themeColor.secondaryLabelColor)
                                .font(.poppins(.bold, size: 20))
                        }
                        Spacer()
                    }
                    SearchBarView(searchText: .constant(""))
                }
                .padding(.trailing,25)
                QuickCategoryView(categorys: homeViewModel.categories)
                OffersView()
                QuickSubCategoryView()
            }
            .padding(.leading,25)
            .background(Color.themeColor.backgroundScreenColor
                .ignoresSafeArea())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView(content: {
            HomeView()

        })
    }
}
