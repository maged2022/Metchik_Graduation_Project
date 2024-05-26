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
        if let subCategoryViewModel = DependencyManager.shared.sharedContainer.resolve(SubCategoryViewModel.self) {
            SubCategoryCardView()
                .environmentObject(subCategoryViewModel)
        }
    }
}

struct SubCategoryViewCell: View {
    @EnvironmentObject var viewModel: SubCategoryViewModel
    @State var subCategory: String
    var body: some View {
        ZStack(alignment: viewModel.isLeadingAlignment(for: subCategory) ? .leading : .trailing) {
            AsyncImage(url: viewModel.subCategoriesImages[subCategory] ) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(15)
            } placeholder: {
                ProgressView()
                    .frame(height: 200)
            }
                
            VStack(alignment:.leading) {
                Text(subCategory)
                    .font(.poppins(.bold, size: 16))
                Text("\(viewModel.getProductsCount(for: subCategory)) Product")
                    .font(.poppins(.semiBold, size: 11))
            }
            .foregroundColor(Asset.Colors.primaryLabelColor.swiftUIColor)
            .padding( viewModel.isLeadingAlignment(for: subCategory) ? .leading : .trailing ,20)
            .frame(maxHeight: .infinity)
            .padding(.horizontal,20)
            .background(Color.white.opacity(0.8).frame(maxHeight: .infinity))
        }
        .padding(.bottom,15)
    }
}
