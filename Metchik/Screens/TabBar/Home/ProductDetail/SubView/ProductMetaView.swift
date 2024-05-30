//
//  ProductMetaView.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI

struct ProductMetaView: View {
    typealias Colors = Asset.Colors

    @State var rating: Double = 3
    @EnvironmentObject var viewModel: ProductDetailViewModel

    var body: some View {
        
        VStack(alignment:.leading) {
            Text(viewModel.product.name)
                .font(.poppins(.semiBold, size: 18))
                .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
            Text(viewModel.product.shortDescription)
                .font(.poppins(.regular, size: 11))
                .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
            HStack(spacing:10) {
                ForEach(1..<6) { index in
                    Image(systemName: "star.fill")
                        .foregroundColor((Int(rating) >= index ? Colors.starYellowColor.swiftUIColor : .gray))
                        .frame(width: 12,height: 12)
                        .scaledToFill()
                        .onTapGesture {
                            rating = Double(index)
                        }
                }
                Text("(\(viewModel.productDetail?.review ?? 00) Review)")
                    .font(.poppins(.regular, size: 11))
            }
        }
    }
}

struct ProductMetaView_Previews: PreviewProvider {
    static var previews: some View {
        if let productDetailViewModel = DependencyManager.shared.sharedContainer
            .resolve(ProductDetailViewModel.self) {

            ProductMetaView()
                .environmentObject(productDetailViewModel)
        }
    }
}
