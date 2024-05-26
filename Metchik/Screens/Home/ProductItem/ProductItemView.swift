//
//  ProductItemView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductItemView: View {
    typealias Colors = Asset.Colors
    @StateObject var productItemViewModel: ProductItemViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                productItemViewModel.productItemPressed()
            } label: {
                VStack {
                    AsyncImage(url: productItemViewModel.product.imageURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame( height: 170)
                            .cornerRadius(15)
                        
                    } placeholder: {
                        ProgressView()
                            .scaledToFit()
                            .frame( height: 170)
                            .cornerRadius(15)
                    }
                    Text(productItemViewModel.product.name)
                        .font(.poppins(.semiBold, size: 14))
                        .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)

                    HStack {
                        Text("\(String(format: "%.2f", productItemViewModel.product.price)) L.E")
                            .font(.poppins(.regular, size: 11))
                            .foregroundColor(Colors.secondaryLabelColor.swiftUIColor)
                            .strikethrough()
                        
                        Text(String(format: "%.2f",
                                    productItemViewModel.product.price -
                                    ((productItemViewModel.product.discountPrecentage / 100.00)
                                   * productItemViewModel.product.price)) + "L.E")
                            .font(.poppins(.semiBold, size: 14))
                            .foregroundColor(Colors.primaryLabelColor.swiftUIColor)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            
            Button {
                productItemViewModel.favoriteButtonPressed()
            } label: {
                Image(uiImage:
                        productItemViewModel.product.isFavorite ?  Asset.Icons.love.image : Asset.Icons.lovewhite.image
                )
                    .resizable()
                    .frame(width: 25,height: 25)
                    .padding(15)
            }
        }
        .popup(isPresented: productItemViewModel.showAlert, content: {
            SnackBar(title: "Error!",
                     message: productItemViewModel.alertMessage,
                     buttonTitle: "OK",
                     onClick: {
                productItemViewModel.showAlert = false
            })
        })
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        if let productItemViewModel = DependencyManager.shared.sharedContainer
            .resolve(ProductItemViewModel.self) {
            ProductItemView(productItemViewModel: productItemViewModel)
        }
    }
}
