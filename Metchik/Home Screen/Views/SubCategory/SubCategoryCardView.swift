//
//  SubCategoryCardView.swift
//  Metchik
//
//  Created by Faculty on 23/12/2023.
//

import SwiftUI

struct SubCategoryCardView: View {
    let category: String
    let subCategory: SubCategory
    
    var body: some View {
        VStack {
            Text(subCategory.name)
                .font(.title2)
                .fontWeight(.bold)
                . shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
            Image("\(category) \(subCategory.name)")
                .resizable()
                .scaledToFit()
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: -5, y: -5)
           
        }
    }
}

struct SubCategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoryCardView(category: "Men", subCategory: SubCategory(name: "Shoes"))
    }
}
