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
    @State private var scanPosition: CGFloat = 0
    var body: some View {
        VStack (spacing: 0){
            Spacer().frame(height: 10)
            HStack {
                AsyncImage(url: virtualTryViewModel.productImageURL) { image in
                    image
                        .resizable()
                        .frame(height: 180)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.1), radius: 10)
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                        .frame(height: 180)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(8)
                        .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
                }
                Image(uiImage: virtualTryViewModel.personImage)
                    .resizable()
                    .frame(height: 180)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.1), radius: 10)
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
                    .shadow(color: .black.opacity(0.1), radius: 10)
            } placeholder: {
                ZStack {
                    Image(uiImage: virtualTryViewModel.personImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .padding()
                        .mask(
                            GeometryReader { geometry in
                                Rectangle()
                                    .frame(height: scanPosition)
                            }
                        )
                        .overlay {
                            ScannerView(scanPosition: $scanPosition)
                        }
                }
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
