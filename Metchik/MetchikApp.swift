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
                    MainCategoryView()
                    
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
