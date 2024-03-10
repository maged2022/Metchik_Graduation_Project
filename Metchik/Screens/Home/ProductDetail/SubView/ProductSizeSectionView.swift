//
//  ProductSizeSectionView.swift
//  Metchik
//
//  Created by Hassan on 11/02/2024.
//

import SwiftUI

struct ProductSizeSectionView: View {
    typealias Colors = Asset.Colors
    @EnvironmentObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Size")
                .font(.poppins(.semiBold, size: 16))
                .frame(maxWidth: .infinity,alignment: .leading)
            HStack(alignment: .center, spacing: 15) {
                ForEach(ProductSizes.allCases, id: \.self) { size in
                    Text(size.rawValue)
                        .font(.poppins(.semiBold, size: 14))
                        .foregroundColor(getForegroundColor(for: size))
                        .frame(width: 40, height: 40)
                        .background(sizeBackground(for: size))
                        .onTapGesture {
                            if viewModel.availableSizes.contains(size) {
                                viewModel.selectedSize = size
                            }
                        }
                }
            }
        }
    }
    
    @ViewBuilder
    func sizeBackground(for size: ProductSizes) -> some View {
        if viewModel.selectedSize == size {
            RoundedRectangle(cornerRadius: 25)
                .fill( Color.black)
        } else {
            RoundedRectangle(cornerRadius: 25)
                .stroke()
                .foregroundColor(Colors.borderCategoryColor.swiftUIColor)
        }
    }
    func getForegroundColor(for size: ProductSizes) -> Color {
        if viewModel.selectedSize == size {
            return Colors.primaryButtonColor.swiftUIColor
        } else if viewModel.availableSizes.contains(size) {
            return Colors.secondaryButtonColor.swiftUIColor
        } else {
            return Colors.borderCategoryColor.swiftUIColor
        }
    }
}

struct ProductSizeSectionView_Previews: PreviewProvider {
    static var previews: some View {
        if let productDetailViewModel = DependencyManager.shared.sharedContainer.resolve(ProductDetailViewModel.self) {
            ProductSizeSectionView()
                .environmentObject(productDetailViewModel)
        }
    }
}
