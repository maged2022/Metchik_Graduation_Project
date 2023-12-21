//
//  CategoryCardView.swift
//  Metchik
//
//  Created by maged on 17/12/2023.
//

import SwiftUI

struct CategoryCardView: View {
    
    let category: Category
    
    var body: some View{
        VStack {
            
            Image(category.name)
                .resizable()
                .scaledToFit()
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: -5, y: -5)
            Text(category.name)
                .font(.title2)
                .fontWeight(.bold)
                . shadow(color: Color.black.opacity(0.5), radius: 5, x: 10, y: 10)
        }
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(category: Category(name: "Men"))
    }
}
