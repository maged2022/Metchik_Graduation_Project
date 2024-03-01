//
//  MetchikApp.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

@main
struct MetchikApp: App {
    
    @State private var showLaunchScreen: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    TabView(selection: .constant(1),
                            content: {
                        HomeView()
                            .tabItem {
                                Text("Home")
                                Image(systemName: "house.fill")
                            }.tag(0)
                        CartView(viewModel: CartViewModel())
                            .tabItem {
                                VStack {
                                    Text("cart")
                                    Image(systemName: "cart.fill")
                                }
                            }.tag(1)
                        Text("Profile Tab")
                            .tabItem {
                                VStack {
                                    Text("profile")
                                    Image(systemName: "person.fill")
                                }
                            }.tag(2)
                    })
                    
                }
                .navigationViewStyle(StackNavigationViewStyle())
                ZStack {
                    if showLaunchScreen {
                        LaunchView(showLaunchScreen: $showLaunchScreen)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2)
                
            }
        }
    }
}
