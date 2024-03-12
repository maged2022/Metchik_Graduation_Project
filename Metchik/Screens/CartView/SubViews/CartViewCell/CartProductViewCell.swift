//
//  CartProductViewCell.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import SwiftUI

struct CartProductViewCell: View {
    typealias Colors = Asset.Colors
    @StateObject var viewModel: CartProductViewModelCell
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 6) {
            
            viewModel.product.mainImage
                .resizable()
                .scaledToFill()
                .frame(width: 80,height: 80)
                .cornerRadius(10)
            
            VStack(alignment: .leading,spacing: 2) {
                Text(viewModel.product.name)
                    .font(.poppins(.semiBold, size: 14))
                
                Text(viewModel.product.shortDescription)
                    .font(.poppins(.regular, size: 11))
                    .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
                    .padding(.bottom,12)
                Text("\(String(format: "%.2f", viewModel.product.price)) L.E")
                    .font(.poppins(.bold, size: 14))
                    .padding(.bottom,4)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            VStack {
                HStack {
                    
                    viewModel.cartProduct.color
                        .frame(width: 20, height: 20)
                        .cornerRadius(10)
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
            .cornerRadius(13)
        }
        
    }
}
struct CartProductViewCell_Previews: PreviewProvider {
    static var previews: some View {
        if let cartViewModel = DependencyManager.shared.sharedContainer.resolve(CartViewModel.self) {
            
            CartProductViewCell(viewModel: CartProductViewModelCell(product: Product.mockData, cartProduct: CartProduct(productID: "1", size: .l, color: .black, selectedCount: 3)))
                .environmentObject(cartViewModel)
        }

    }
}
