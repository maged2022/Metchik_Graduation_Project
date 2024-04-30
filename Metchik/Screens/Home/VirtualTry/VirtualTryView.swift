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
            HStack {
                AsyncImage(url: virtualTryViewModel.productImageURL) { image in
                    image
                        .resizable()
                        .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 430)
                } placeholder: {
                    ProgressView()
                }
                Image(uiImage: virtualTryViewModel.personImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .navigationBarTitle("Selected Image")
                    .edgesIgnoringSafeArea(.all)
            }
           
            AsyncImage(url: virtualTryViewModel.virtualImageURL) { image in
                image
                    .resizable()
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 430)
            } placeholder: {
                ProgressView()
            }
        }
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
