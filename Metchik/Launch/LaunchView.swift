//
//  LaunchView.swift
//  CryptoCoinApp
//
//  Created by s on 14/10/2023.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = "Metchik Store App...".map({String($0)})
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    @State private var loop: Int = 0
    @Binding var showLaunchScreen: Bool
    
    var body: some View {
        ZStack {
            Color.launchScreenColor.launchBackgroundColor
                .ignoresSafeArea()
            
            Image("logo_image")
                .resizable()
                .frame(width: 200, height: 200)
            
            ZStack {
                if showLoadingText {
                    
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.title)
                                .foregroundColor(Color.launchScreenColor.launchAccentColor)
                                .fontWeight(.bold)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeInOut))
                    
                }
                
            }
            .offset( y: 130)
        }
        .onAppear{
                showLoadingText = true
        }
        
        .onReceive(timer) { receivedValue in
            withAnimation(.spring()) {
                if counter == loadingText.count {
                    counter = 0
                    loop += 1
                    if loop >= 2 {
                        showLaunchScreen = false
                    }
                }else {
                    counter += 1
                }
            }
            print("counter: \(counter)")
        }
    }
}


