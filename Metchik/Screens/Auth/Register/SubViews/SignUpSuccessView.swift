//
//  SignUpSuccessView.swift
//  Metchik
//
//  Created by Hassan on 07/05/2024.
//

import SwiftUI

struct SignUpSuccessView: View {
    @StateObject var viewModel: SignUpSuccessViewModel
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "checkmark.circle")
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .foregroundColor(.green)
                
            VStack(alignment: .center) {
                Text("Successful!")
                    .font(.poppins(.bold, size: 24))
                .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
            Text("you have successfully registered in our app and start working in it.")
                    .multilineTextAlignment(.center)
                .font(.poppins(.regular, size: 14))
                .foregroundStyle(Asset.Colors.secondaryLabelColor.swiftUIColor)
            }
            .padding(.top, 35)
            .padding(.horizontal,40)
            Spacer()
            Button {
                viewModel.startButtonPressed()
            } label: {
                Text("Start Shopping")
                    .font(.poppins(.bold, size: 16))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                    .background(Asset.Colors.secondaryButtonColor.swiftUIColor)
                    .cornerRadius(30)
            }
            .padding(.bottom,75)

        }.padding(25)
    }
}
struct SignUpSuccessView_Previews: PreviewProvider {
    
    static var previews: some View {
        if let signUpSuccessViewModel = DependencyManager.shared.sharedContainer.resolve(SignUpSuccessViewModel.self) {
            SignUpSuccessView(viewModel: signUpSuccessViewModel)
        }
    }
}
