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
            ForEach(viewModel.subCategories, id: \.self) { subCategory in
                Button {
                    viewModel.subCategoryViewPressed(subCategory: subCategory)
                } label: {
                    SubCategoryViewCell(subCategory: subCategory)
                }
            }
        }
    }
}

struct SubCategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
               let router = AppRouter(navigationController: navigationController)
               let homeCoordinator = HomeTabCoordinator(router: router)

               let subCategoryViewModel = SubCategoryViewModel(category: "Men", coordinator: homeCoordinator)
        SubCategoryCardView()
            .environmentObject(subCategoryViewModel)
    }
}

struct SubCategoryViewCell: View {
    @EnvironmentObject var viewModel: SubCategoryViewModel
    @State var subCategory: String
    var body: some View {
        ZStack(alignment: viewModel.isLeadingAlignment(for: subCategory) ? .leading : .trailing) {
            Asset.Images.discountImage2.swiftUIImage
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .cornerRadius(15)
            VStack(alignment:.leading) {
                Text(subCategory)
                    .font(.poppins(.bold, size: 16))
                Text("\(viewModel.getProductsCount(for: subCategory)) Product")
                    .font(.poppins(.semiBold, size: 11))
            }
            .foregroundColor(Asset.Colors.primaryLabelColor.swiftUIColor)
            .padding( viewModel.isLeadingAlignment(for: subCategory) ? .leading : .trailing ,20)
        }
        .padding(.bottom,15)
    }
}
