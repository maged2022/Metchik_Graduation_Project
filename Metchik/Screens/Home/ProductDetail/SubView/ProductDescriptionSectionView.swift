//
//  ProductDescriptionSectionView.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI

struct ProductDescriptionSectionView: View {
    typealias Colors = Asset.Colors

    @EnvironmentObject var viewModel: ProductDetailViewModel

    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text("Description")
                .font(.poppins(.semiBold, size: 16))
                .foregroundColor(Colors.primaryLabelColor.swiftUIColor)
            
            Text(viewModel.productDetail?.description ?? "????")
            .font(.poppins(.regular, size: 11))
            .foregroundColor(Colors.secondaryLabelColor.swiftUIColor)
        }
        .padding(.bottom,30)
    }
}

struct ProductDescriptionSectionView_Previews: PreviewProvider {
    static var previews: some View {
        if let homeCoordinator = DependencyManager.shared.sharedContainer.resolve(HomeTabCoordinatorProtocol.self) {
            let productDetailViewModel = ProductDetailViewModel(
                productDetailViewUseCase: .init(product: .mockData),
                coordinator: homeCoordinator
            )
            ProductDescriptionSectionView()
                .environmentObject(productDetailViewModel)
        }
    }
}
