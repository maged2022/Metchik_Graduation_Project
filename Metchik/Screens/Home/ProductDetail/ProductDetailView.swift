//
//  ProductDetailView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductDetailView: View {
    typealias Colors = Asset.Colors
    @StateObject var productDetailViewModel : ProductDetailViewModel
    var body: some View {
        
        VStack {
           
            ProductImagesSectionView()
            VStack(alignment: .leading) {
                HStack {
                    ProductMetaView()
                    Spacer()
                    StepperView()
                }
                HStack {
                    ProductSizeSectionView()
                    
                    ProductColorsView()

                }
                
                ProductDescriptionSectionView()
                
                AddToCartSectionView()
            }
            .padding(.vertical,20)
            .padding(.horizontal,25)
            .padding(.bottom,-25)
            .background(Colors.backgroundScreenColor.swiftUIColor
                .ignoresSafeArea()
                .cornerRadius(30)
            )
            .offset(y:-30)
        }
        .environmentObject(productDetailViewModel)
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productDetailViewModel: ProductDetailViewModel(product:Product.mockData)
        )
        .previewLayout(.fixed(width: 500, height: 1000))
    }
}
