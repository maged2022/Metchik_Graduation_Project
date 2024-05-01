//
//  VirtualTryView.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import SwiftUI

struct VirtualTryView: View {
    @StateObject var virtualTryViewModel : VirtualTryViewModel

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
            } placeholder: {
                ProgressView("ML Processing Image")
                    .padding()
            }
            Spacer()
           
        }
        .background(
            Color(red: 220 / 255, green: 224 / 255, blue: 225 / 255)
        )
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
