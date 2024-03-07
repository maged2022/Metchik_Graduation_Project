//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel: HomeViewModel
    @State private var offset = CGFloat.zero
    @State private var showQuickCategoryView = false
    let height: CGFloat = 70
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            headerView
            
            SearchBarView(searchText: .constant(""))
                .padding(.horizontal,25)
            quickCategoryView
            
            contentScrollView
        }
        .offset(CGSize(width: 0,height: (offset < height) ? (offset > -1 ) ? -offset : 0  : -height))
        .animation(.spring)
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor
            .ignoresSafeArea())
        .navigationBarItems(
            leading: leadingNavigationButton
            ,trailing: trailingNavigationButton )
        .environmentObject(homeViewModel)
        .onAppear {showCategory() }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView(content: {
            let navigationController = UINavigationController()
            let router = AppRouter(navigationController: navigationController)
            let homeCoordinator = HomeTabCoordinator(router: router)

            let homeViewModel = HomeViewModel(coordinator: homeCoordinator)
           
            HomeView(homeViewModel: homeViewModel)
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
        HStack {
            VStack(alignment:.leading) {
                Text("Welcome,")
                    .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
                    .font(.poppins(.bold, size: 25))
                Text("Our Fashions App")
                    .foregroundStyle(Asset.Colors.secondaryLabelColor.swiftUIColor)
                    .font(.poppins(.bold, size: 20))
            }
            Spacer()
        }
        .padding(.leading,25)
        .offset(getNewHeaderOffset())
        .scaleEffect(getNewHeaderScale())
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
        ScrollView {
            VStack(spacing:25) {
                OffersView()
                QuickSubCategoryView()
            }
            .background(GeometryReader { proxy -> Color in
                DispatchQueue.main.async {
                    offset = -proxy.frame(in: .named("scroll")).origin.y
                    if offset < -1 {
                        showCategory()
                    }
                }
                return Color.clear
            })
        }
        .coordinateSpace(name: "scroll")
        .offset(CGSize(width: 0, height: height))
        .padding(.top,-height )
    }
    
    func getNewHeaderOffset() -> CGSize {
        let newOffset = -offset
        if newOffset > 0 {
            return CGSize(width: 0, height: 0)
        } else if newOffset > -height {
            return CGSize(width: newOffset*4 , height: offset)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func getNewHeaderScale() -> CGSize {
        let newOffset = offset
        if newOffset < 0 {
            return CGSize(width: 1, height: 1)
        } else if newOffset + 10 < height {
            return CGSize(
                width: 1 - newOffset / height,
                height: 1 - newOffset / height)
        }
        return CGSize(width: 0, height: 0)
    }
}
