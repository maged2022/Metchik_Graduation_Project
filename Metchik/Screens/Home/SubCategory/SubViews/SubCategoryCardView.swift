//
//  SubCategoryCardView.swift
//  Metchik
//
//  Created by hassan on 23/12/2023.
//

import SwiftUI

struct SubCategoryCardView: View {
    @EnvironmentObject var viewModel: SubCategoryViewModel
    var body: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.subCategories.indices, id: \.self) { index in
                NavigationLink(
                    destination:
                        NavigationLazyView(
                         ProductView(
                             productViewModel: ProductViewModel(
                                selectedCategory: viewModel.category,
                                 selectedSubCategory: viewModel.subCategories[index])
                         )
                        )
                ) {
                        SubCategoryViewCell( index: index)
                    }
            }
        }
        
    }
}

struct SubCategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoryCardView()
            .environmentObject(SubCategoryViewModel(category: "Men"))
    }
}

struct SubCategoryViewCell: View {
    @EnvironmentObject var viewModel: SubCategoryViewModel
    @State var index: Int
    var body: some View {
        ZStack(alignment: index.isMultiple(of: 2) ? .leading : .trailing) {
            AssetImage.discountImage2.swiftUIImage
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .cornerRadius(15)
            VStack(alignment:.leading) {
                Text(viewModel.subCategories[index])
                    .font(.poppins(.bold, size: 16))
                Text("\(viewModel.getProductsCount(for: viewModel.subCategories[index])) Product")
                    .font(.poppins(.semiBold, size: 11))
            }
            .foregroundColor(Asset.Colors.primaryLabelColor.swiftUIColor)
            .padding(index.isMultiple(of: 2) ? .leading : .trailing ,20)
        }
        .padding(.bottom,15)
    }
}
