//
//  WishListViewCell.swift
//  Metchik
//
//  Created by Hassan on 09/05/2024.
//

import SwiftUI

struct WishListViewCell: View {
    @StateObject var viewModel: WishListViewModelCell
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 6) {
            
            AsyncImage(url: viewModel.product.imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80,height: 80)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading,spacing: 2) {
                Text(viewModel.product.name)
                    .font(.poppins(.semiBold, size: 14))
                
                Text(viewModel.product.shortDescription)
                    .font(.poppins(.regular, size: 11))
                    .foregroundStyle(Asset.Colors.secondaryLabelColor.swiftUIColor)
                    .padding(.bottom,12)
                Text("\(String(format: "%.2f", viewModel.product.price)) L.E")
                    .font(.poppins(.bold, size: 14))
                    .padding(.bottom,4)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Button {
                viewModel.addToCarButtonPressed()
            } label: {
                Text("Add to Cart")
                    .font(.poppins(.bold, size: 10))
                    .frame(width: 80,height: 30)
                    
                    .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                    .background(Asset.Colors.secondaryButtonColor.swiftUIColor)
                    .cornerRadius(30)
                    .padding(.trailing,10)
            }

        }
        
    }
}

struct WishListViewModelCell_Previews: PreviewProvider {
    static var previews: some View {
        if let wishListViewModelCell = DependencyManager.shared.sharedContainer
            .resolve(WishListViewModelCell.self) {
            WishListViewCell(viewModel: wishListViewModelCell)
        }
    }
}
