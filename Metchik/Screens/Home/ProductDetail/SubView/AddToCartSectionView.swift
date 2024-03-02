//
//  AddToCartSectionView.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI

struct AddToCartSectionView: View {
    typealias Colors = Asset.Colors

    @EnvironmentObject var viewModel: ProductDetailViewModel

    var body: some View {
        HStack(spacing: 50) {
            VStack(alignment:.leading) {
                Text("Total Price")
                    .font(.poppins(.regular, size: 9))
                    .foregroundColor(Colors.borderCategoryColor.swiftUIColor)
                Text("$\(String(format: "%.2f", viewModel.getTotalPrice()))")
                    .font(.poppins(.bold, size: 18))
                    .foregroundColor(Colors.primaryLabelColor.swiftUIColor)
            }
            
            Button(action: {
                viewModel.addToCart()
            }, label: {
                Text("Add To Cart")
                    .foregroundColor(Colors.primaryButtonColor.swiftUIColor)
                    .font(.poppins(.semiBold, size: 16))
                    .frame(maxWidth: .infinity)
                    .frame( height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Colors.secondaryButtonColor.swiftUIColor)
                    )
                
            })
        }
    }
}

struct AddToCartSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartSectionView()
            .environmentObject(ProductDetailViewModel(product:Product.mockData))
    }
}
