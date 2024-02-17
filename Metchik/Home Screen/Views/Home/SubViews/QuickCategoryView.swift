//
//  CategoryCardView.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import SwiftUI

struct QuickCategoryView: View {
    
    let categorys: [Category]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categorys) { category in
                        Text(category.name)
                            .font(.poppins(.bold, size: 13))
                            .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
                            .frame(width: 80,height: 30)
                            .background {
                                Capsule()
                                    .stroke(style: .init())
                                    .foregroundColor(Colors.borderCategoryColor.swiftUIColor)
                            }
                    }
                }
            }
            
        }
    }
}

struct QuickCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCategoryView(categorys: [Category(name: "Men")])
    }
}
