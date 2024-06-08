//
//  LoginView.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing:40) {
            
            logoImage
            welcomeSection
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.bottom,10)
            
            VStack(spacing: 25) {
                InputView(
                    text: $viewModel.email,
                    title: "Email",
                    placeholder: "name@example.com"
                )
                
                InputView(
                    text: $viewModel.password,
                    title: "Password",
                    placeholder: "Enter Your Password",
                    isSecureField: true
                )
            }
            
            LoginButtonView()
            
        }
        .padding(25)
        .environmentObject(viewModel)
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor )
    }
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        if let loginViewModel = DependencyManager.shared.sharedContainer.resolve(LoginViewModel.self) {
            LoginView(viewModel: loginViewModel)
        }
    }
}

extension LoginView {
    private var logoImage: some View {
        Asset.Images.logo.swiftUIImage
            .resizable()
            .scaledToFit()
            .frame(height: 150)
    }
    
   private var welcomeSection: some View {
        VStack(alignment:.leading,spacing: 6) {
            Text("Welcome!")
                .font(.poppins(.semiBold, size: 20))
                .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
            Text("please login or sign up to continue our app")
            
                .font(.poppins(.regular, size: 14))
                .foregroundStyle(Asset.Colors.secondaryLabelColor.swiftUIColor)
        }
    }
}
