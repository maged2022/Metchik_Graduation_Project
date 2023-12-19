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
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Text(category.name)
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(category: Category(name: "Men"))
    }
}
