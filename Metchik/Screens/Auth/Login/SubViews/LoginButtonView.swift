//
//  LoginButtonView.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import SwiftUI

struct LoginButtonView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    var body: some View {
        VStack(spacing: 10) {
            Button(action: {
                viewModel.loginButtonPressed()
            }, label: {
                Text("Login")
                    .font(.poppins(.bold, size: 16))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                    .background(Asset.Colors.secondaryButtonColor.swiftUIColor)
                    .cornerRadius(30)
                    
            })
            .disabled(viewModel.isLoggenActive)
            Text("or")
            VStack(spacing: 15) {
                Button(action: {
                    viewModel.loginWithFacebookButtonPressed()
                }, label: {
                    Text("Continue with Facebook")
                        .font(.poppins(.semiBold, size: 16))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                        .background(Asset.Colors.seconderyFacebookButtonColor.swiftUIColor)
                        .cornerRadius(30)
                })
                .disabled(viewModel.isLoggenActive)

                Button(action: {
                    viewModel.loginWithGoogleButtonPressed()
                }, label: {
                    Text("Continue with Google")
                        .font(.poppins(.semiBold, size: 16))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Asset.Colors.secondaryLabelColor.swiftUIColor)
                        .background(
                          RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Asset.Colors.borderButtonColor.swiftUIColor)
                        )
                })
                .disabled(viewModel.isLoggenActive)

                Button(action: {
                    viewModel.loginWithAppleButtonPressed()
                }, label: {
                    Text("Continue with Apple")
                        .font(.poppins(.semiBold, size: 16))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Asset.Colors.secondaryLabelColor.swiftUIColor)
                        .background(
                          RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Asset.Colors.borderButtonColor.swiftUIColor)
                        )
                })
                .disabled(viewModel.isLoggenActive)

            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        if let loginViewModel = DependencyManager.shared.sharedContainer
            .resolve(LoginViewModel.self) {
            LoginButtonView()
                .environmentObject(loginViewModel)
        }
    }
}
