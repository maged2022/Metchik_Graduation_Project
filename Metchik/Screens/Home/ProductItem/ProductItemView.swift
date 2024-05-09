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
                    }
                    Text(productItemViewModel.product.name)
                        .font(.poppins(.semiBold, size: 14))
                        .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
                   
                    Text(productItemViewModel.product.shortDescription)
                        .font(.poppins(.regular, size: 11))
                        .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)

                    HStack {
                        Text("\(String(format: "%.2f", productItemViewModel.product.price)) L.E")
                            .font(.poppins(.regular, size: 11))
                            .foregroundColor(Colors.secondaryLabelColor.swiftUIColor)
                            .strikethrough()
                        
                        Text("\(String(format: "%.2f", productItemViewModel.product.discountPrecentage)) L.E")
                            .font(.poppins(.semiBold, size: 14))
                            .foregroundColor(Colors.primaryLabelColor.swiftUIColor)
                    }
                }
            }
            
            Button {
                productItemViewModel.favoriteButtonPressed()
            } label: {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 8,height: 8)
                    .foregroundColor(Colors.primaryButtonColor.swiftUIColor)
                    .scaledToFit()
                    .font(.poppins(.semiBold, size: 8))
                    .frame(width: 20,height: 20)
                    .background(Colors.secondaryButtonColor.swiftUIColor
                    )
                    .cornerRadius(10)
                    .padding(15)

            }
        }
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
