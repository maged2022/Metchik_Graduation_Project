//
//  ProductColorsView.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI

struct ProductColorsView: View {
    typealias Colors = Asset.Colors

    @EnvironmentObject var viewModel: ProductDetailViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(viewModel.availableColors,id: \.self) { color in
                    Button(action: {
                    }, label: {
                        color
                            .overlay {
                                if viewModel.selectedColor == color {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .frame(width: 10,height: 10)
                                        .foregroundColor(color == .white ? .black : .white)
                                }
                            }
                            .frame(width: 20, height: 20)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black.opacity(0.3), lineWidth: 1))
                            .padding(0.6)
                            .onTapGesture {
                                viewModel.selectedColor = color
                            }
                    })
                }
            }
        }
        .padding(10)
        .frame(height: 120)
        .background(Color.white
            .cornerRadius(30))
        .shadow(color: .black.opacity(0.1),radius: 10)
    }
}
struct ProductColorsView_Previews: PreviewProvider {
    static var previews: some View {
        if let homeCoordinator = DependencyManager.shared.sharedContainer.resolve(HomeTabCoordinatorProtocol.self) {
            let productDetailViewModel = ProductDetailViewModel(
                productDetailViewUseCase: .init(product: .mockData),
                coordinator: homeCoordinator
            )
            ProductColorsView()
                .environmentObject(productDetailViewModel)
        }

    }
}
