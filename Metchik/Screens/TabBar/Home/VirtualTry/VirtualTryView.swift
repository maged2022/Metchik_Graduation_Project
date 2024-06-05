//
//  VirtualTryView.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import SwiftUI

struct VirtualTryView: View {
    @StateObject var virtualTryViewModel : VirtualTryViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Spacer().frame(height: 10)
            HStack {
                AsyncImage(url: virtualTryViewModel.productImageURL) { image in
                    image
                        .resizable()
                        .frame(height: 180)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                        .frame(height: 180)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(8)
                }
                Image(uiImage: virtualTryViewModel.personImage)
                    .resizable()
                    .frame(height: 180)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            
            Spacer().frame(height: 40)
            
            AsyncImage(url: virtualTryViewModel.virtualImageURL) { image in
                image
                    .resizable()
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 430)
                    .cornerRadius(15)
                    .padding()
            } placeholder: {
                ProgressView("ML Processing Image")
                    .padding()
                    .scaleEffect(1.2)
            }
            Spacer()
        }
        .background(
            Asset.Colors.backgroundScreenColor.swiftUIColor
        )
        .popup(isPresented: virtualTryViewModel.showAlert, content: {
            SnackBar(type: .error,
                     message: virtualTryViewModel.alertMessage,
                     icon: .cart,
                     onClick: {
                
                virtualTryViewModel.showAlert = false
                presentationMode.wrappedValue.dismiss()
            })
        })
    }
}

struct VirtualTryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            if let virtualTryViewModel = DependencyManager.shared.sharedContainer
                .resolve(VirtualTryViewModel.self) {
                VirtualTryView(virtualTryViewModel: virtualTryViewModel)
            }
        })
    }
}
