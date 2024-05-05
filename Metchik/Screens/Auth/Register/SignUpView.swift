//
//  SignUpView.swift
//  Metchik
//
//  Created by Hassan on 03/05/2024.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel

    var body: some View {
        VStack(spacing: 25) {
            logoImage
            welcomeSection
            InputView(
                text: $viewModel.userName,
                title: "User Name",
                placeholder: "ex hassan"
            )
            InputView(
                text: $viewModel.email,
                title: "Email",
                placeholder: "user@example.com"
            )
            InputView(
                text: $viewModel.password,
                title: "Password",
                placeholder: "Enter your password",
                isSecureField: true
            )
            InputView(
                text: $viewModel.confirmPassword,
                title: "Confirm Password",
                placeholder: "Enter your Confirm password",
                isSecureField: true
            )
            
            agreementSection
            
            Button(action: {
                viewModel.signUpButtonPressed()
            }, label: {
                Text("Login")
                    .font(.poppins(.bold, size: 16))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                    .background(Asset.Colors.secondaryButtonColor.swiftUIColor)
                    .cornerRadius(30)
                    
            })
            .disabled(viewModel.isSignUpActive)
        }
        .padding(25)
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackButton(router: viewModel.coordinator.router))
    }
}

struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        if let signUpViewModel = DependencyManager.shared.sharedContainer.resolve(SignUpViewModel.self) {
            SignUpView(viewModel: signUpViewModel)
        }
    }
}

extension SignUpView {
    private var logoImage: some View {
        Asset.Images.logo.swiftUIImage
            .resizable()
            .scaledToFit()
            .frame(height: 200)
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
    
    private var agreementSection: some View {
        HStack(alignment:.top,spacing: 15) {
            Button {
                viewModel.agreedToTerms.toggle()
            } label: {
                Image(systemName: viewModel.agreedToTerms ? "checkmark.square.fill" : "square")
                    .foregroundColor(viewModel.agreedToTerms ? .blue : Asset.Colors.searchLabelColor.swiftUIColor)
            }
            Text("By creating an account you have to agree with our them & condication.")
                .font(.poppins(.regular, size: 14))
                .foregroundColor(Asset.Colors.searchLabelColor.swiftUIColor)

        }
        
    }
}
