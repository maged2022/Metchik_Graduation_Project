//
//  CartProductViewCell.swift
//  Metchik
//
//  Created by Hassan on 06/05/2024.
//

import SwiftUI

struct CartProductViewCell: View {
    typealias Colors = Asset.Colors
    @StateObject var viewModel: CartProductViewModelCell
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 6) {
            
            AsyncImage(url: viewModel.product.imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80,height: 80)
                    .cornerRadius(10)
                    .padding(.leading)
            } placeholder: {
                ProgressView()
                    .frame(width: 80,height: 80)
                    .cornerRadius(10)
                    .padding(.leading)
            }
            VStack(alignment: .leading,spacing: 2) {
                Text(viewModel.product.name)
                    .font(.poppins(.semiBold, size: 14))
                    .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
                Text(viewModel.product.shortDescription)
                    .font(.poppins(.regular, size: 11))
                    .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
                    .padding(.bottom,12)
                Text(String(format: "%.2f",
                            viewModel.product.price -
                                    ((viewModel.product.discountPrecentage / 100.00)
                                   * viewModel.product.price)) + " L.E")
                    .font(.poppins(.bold, size: 14))
                    .padding(.bottom,4)
                    .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.leading, 5)
            VStack {
                HStack {
                    viewModel.cartProduct.color
                        .frame(width: 20, height: 20)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black.opacity(0.3), lineWidth: 1))
                        .padding(0.6)
                    Text(viewModel.cartProduct.size.rawValue)
                        .font(.poppins(.semiBold, size: 14))
                        .foregroundColor(Colors.secondaryButtonColor.swiftUIColor
                        )
                        .frame(width: 30, height: 30)
                        .background(  RoundedRectangle(cornerRadius: 15)
                            .stroke()
                            .foregroundColor(Colors.borderCategoryColor.swiftUIColor))
                }
                VStack {
                    StepperView(
                        maxAvailableProduct: $viewModel.maxAvailableProduct,
                        currentStepperValue: $viewModel.currentStepperValue)
                }
            }
            .padding(.trailing)
            .cornerRadius(13)
        }
        .frame(height: 115)
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor )
        .cornerRadius(13)
        .padding(1)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: -1, y: -1)
    }
}
struct CartProductViewCell_Previews: PreviewProvider {
    static var previews: some View {
        if let cartProductViewModelCell = DependencyManager.shared.sharedContainer
            .resolve(CartProductViewModelCell.self) {
            CartProductViewCell(viewModel: cartProductViewModelCell)
        }
    }
}
