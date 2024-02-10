//
//  CategoryCardView.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import SwiftUI

struct QuickCategoryView: View {
    
    let categorys: [Category]
    
    var body: some View{
        VStack {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack () {
                    ForEach(categorys) { category in
                        Text(category.name)
                            .font(.poppins(.bold, size: 13))
                            .foregroundStyle(Color.themeColor.primaryLabelColor)
                            .frame(width: 80,height: 30)
                            .background {
                                Capsule()
                                    .stroke(style: .init())
                                    .foregroundColor(Color.themeColor.borderCategoryColor)
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
