//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel: HomeViewModel
    @State private var showWelcome = true
    @State private var showQuickCategoryView = false
    let height: CGFloat = 80
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer().frame(height: 1)
            if showWelcome {
                headerView
            }
            searchBarButton
            quickCategoryView
            
            contentScrollView
        }
        .padding(.leading)
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor
            .ignoresSafeArea())
        .navigationBarItems(
            leading: leadingNavigationButton
            ,trailing: trailingNavigationButton )
        .environmentObject(homeViewModel)
        .onAppear {
            showCategory()
            homeViewModel.showTabBar()
        }
        .popup(isPresented: homeViewModel.showAuthAlert, content: {
            SnackBar(type: .authError,
                     message: homeViewModel.alertMessage,
                     icon: .favorite,
                     onClick: {
                homeViewModel.showAuthAlert = false
            }, onClickLogin: {
                homeViewModel.showAuthAlert = false
                homeViewModel.pressLoginButton()
            })
        })   
        .popup(isPresented: homeViewModel.showAlert, content: {
            SnackBar(type: .error,
                     message: homeViewModel.alertMessage,
                     icon: .favorite,
                     onClick: {
                homeViewModel.showAlert = false
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView(content: {
            if let homeViewModel = DependencyManager.shared.sharedContainer.resolve(HomeViewModel.self) {
                
                HomeView(homeViewModel: homeViewModel)
            }
        })
    }
}

extension HomeView {
    
    private var leadingNavigationButton: some View {
        Button {
            homeViewModel.pressedLeadingNavigationButton()
        } label: {
            Asset.Icons.menuIcon.swiftUIImage
                .resizable()
                .frame(width: 17, height: 12)
                .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                .frame(width: 35, height: 35)
                .background(Asset.Colors.secondaryButtonColor.swiftUIColor.cornerRadius(20))
        }
    }
    
    private var trailingNavigationButton: some View {
        
        Button {
            homeViewModel.pressedTrailingNavigationButton()
        } label: {
            Asset.Icons.userIcon.swiftUIImage
                .resizable()
                .frame(width: 56, height: 56)
                .frame(width: 50, height: 50)
                .background(Asset.Colors.userBackground.swiftUIColor.cornerRadius(25))
        }
    }
    
    private var headerView: some View {
        VStack(alignment:.leading, spacing: 5) {
            Text("Welcome,")
                .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
                .font(.poppins(.bold, size: 25))
            Text("Our Fashions App")
                .foregroundStyle(Asset.Colors.secondaryLabelColor.swiftUIColor)
                .font(.poppins(.bold, size: 20))
        }
    }
    
    private var quickCategoryView: some View {
        VStack(spacing:0) {
            if showQuickCategoryView {
                QuickCategoryView()
                    .onAppear {
                        hideCategory()
                    }
            }
        }
    }
    
    private func showCategory() {
        withAnimation {
            showQuickCategoryView = true
        }
    }
    
    private func hideCategory() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            withAnimation {
                showQuickCategoryView = false
            }
        }
    }
    
    private var contentScrollView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing:25) {
                OffersView()
                QuickSubCategoryView()
            }
            .background(GeometryReader { proxy -> Color in
                let offset = proxy.frame(in: .named("scroll")).origin.y - 291
                DispatchQueue.main.async {
                    if offset > 30 {
                        showCategory()
                    } else if offset < -height {
                        self.showWelcome = false
                    } else if offset > -height {
                        self.showWelcome = true
                    }
                }
                return Color.clear
            })
        }
    }
    var searchBarButton: some View {
        Button {
            homeViewModel.showSearchView()
        } label: {
            SearchBarView(searchText: .constant(""), filterButtonClicked: {})
                .disabled(true)
        }
    }
}
