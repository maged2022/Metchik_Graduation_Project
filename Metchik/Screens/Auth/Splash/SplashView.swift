//
//  SplashView.swift
//  Metchik
//
//  Created by Hassan on 01/05/2024.
//

import SwiftUI

struct SplashView: View {
    let viewModel: SplashViewModel
    var body: some View {
        ZStack {
            Asset.Images.splash.swiftUIImage
                .resizable()
            VStack(spacing: 15) {
                Spacer()
                Button {
                    viewModel.guestButtonPressed()
                } label: {
                    Text("Guest")
                        .font(.poppins(.bold, size: 16))
                        .foregroundStyle(Asset.Colors.secondaryButtonColor.swiftUIColor)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Asset.Colors.primaryButtonColor.swiftUIColor)
                        .cornerRadius(30)
                } 
                
                Button {
                    viewModel.loginButtonPressed()
                } label: {
                    Text("Login")
                        .font(.poppins(.bold, size: 16))
                        .foregroundStyle(Asset.Colors.secondaryButtonColor.swiftUIColor)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Asset.Colors.primaryButtonColor.swiftUIColor)
                        .cornerRadius(30)
                }
                
                Button {
                    viewModel.signUpButtonPressed()
                } label: {
                    Text("Sign Up")
                        .font(.poppins(.bold, size: 16))
                        .foregroundStyle(Asset.Colors.primaryButtonColor.swiftUIColor)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(style: StrokeStyle(lineWidth: 2))
                                .fill(Asset.Colors.primaryButtonColor.swiftUIColor)
                                
                        )
                }

            }.padding(25)
        }
        .ignoresSafeArea()
    }
}

struct SplashView_Previews: PreviewProvider {
    
    static var previews: some View {
        if let splashViewModel = DependencyManager.shared.sharedContainer.resolve(SplashViewModel.self) {
            SplashView(viewModel: splashViewModel)
        }
    }
}
