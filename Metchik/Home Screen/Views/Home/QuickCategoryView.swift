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
                            .font(.title2)
                            .fontWeight(.bold)
                            . shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
                    }
                }
            }
            
        }
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCategoryView(categorys: [Category(name: "Men")])
    }
}
