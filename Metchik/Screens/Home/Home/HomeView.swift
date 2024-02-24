//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
    typealias Colors = Asset.Colors

    @State private var homeViewModel = HomeViewModel()
    
    var body: some View {
        
        ScrollView {
            VStack(spacing:25) {
                VStack(spacing:20) {
                    headerView
                    SearchBarView(searchText: .constant(""))
                }
                .padding(.trailing,25)
                QuickCategoryView()
                OffersView()
                QuickSubCategoryView()
                    .padding(.trailing,25)
            }
            .padding(.leading,25)
            .background(Colors.backgroundScreenColor.swiftUIColor
                .ignoresSafeArea())
        }
        .environmentObject(homeViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView(content: {
            HomeView()

        })
    }
}

extension HomeView {
    private var headerView: some View {
        HStack {
            VStack(alignment:.leading) {
                Text("Welcome,")
                    .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
                    .font(.poppins(.bold, size: 25))
                Text("Our Fashions App")
                    .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
                    .font(.poppins(.bold, size: 20))
            }
            Spacer()
        }
    }
}
