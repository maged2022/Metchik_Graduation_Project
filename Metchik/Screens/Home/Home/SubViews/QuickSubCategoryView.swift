//
//  SubCategorySectionView.swift
//  Metchik
//
//  Created by Hassan on 10/02/2024.
//

import SwiftUI

struct QuickSubCategoryView: View {
    @State var sectionName = "new Arrivals"
    var body: some View {
        VStack {
            HStack {
                Text(sectionName)
                    .font(.poppins(.bold, size: 18))
                    .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
                Spacer()
                Button {
                    
                } label: {
                    Text("View All")
                        .font(.poppins(.bold, size: 11))
                        .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
                        .padding(.trailing,25)
                }
            }
            HStack {
                
                ProductItemView(product:
                                    Product(id: "1",
                                            name: "T-Shirt",
                                            images: ["discount_image4"],
                                            price:  142.36,
                                            discountPrice:  122.36)) {
                    
                }
                ProductItemView(product:
                                    Product(id: "1",
                                            name: "T-Shirt",
                                            images: ["discount_image4"],
                                            price:  142.36,
                                            discountPrice:  122.36)) {
                    
                }
                
            }
        }
    }
}

struct QuickSubCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSubCategoryView()
    }
}
