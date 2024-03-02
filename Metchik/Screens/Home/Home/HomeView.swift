//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
    typealias Colors = Asset.Colors

    @StateObject private var homeViewModel = HomeViewModel()
    
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
        
        .navigationBarItems(
            leading:
                NavigationLink(
                    destination: NavigationLazyView(
                        SubCategoryView(
                            subCategoryViewModel: SubCategoryViewModel(
                                category: homeViewModel.selectedCategory)))) {
                    Image(systemName: "text.alignleft")
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.black.cornerRadius(20))
                }
        )
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
