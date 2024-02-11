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
                    .foregroundStyle(Color.themeColor.primaryLabelColor)
                Spacer()
                Button {
                    
                } label: {
                    Text("View All")
                        .font(.poppins(.bold, size: 11))
                        .foregroundStyle(Color.themeColor.secondaryLabelColor)
                        .padding(.trailing,25)
                }
            }
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHStack{
                    ForEach(1..<5){number in
                        ProductItemView(product: Product(id: "1", name: "T-Shirt", images: ["discount_image4"], price:  142.36, discountPrice:  122.36)) {
                            
                        }
                    }
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
