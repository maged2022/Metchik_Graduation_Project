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
                    productItemViewModel.product.mainImage
                        .resizable()
                        .frame(height: 170)
                        .cornerRadius(15)
                        .scaledToFill()
                    
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
                        
                        Text("\(String(format: "%.2f", productItemViewModel.product.discountPercentage)) L.E")
                            .font(.poppins(.semiBold, size: 14))
                            .foregroundColor(Colors.primaryLabelColor.swiftUIColor)
                    }
                }
            }
            
            Button {
                print("favorite button pressed ")
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
