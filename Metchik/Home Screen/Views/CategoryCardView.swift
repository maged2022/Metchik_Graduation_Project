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
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
            Text(category.name)
                .font(.title)
                .fontWeight(.semibold)
                .padding(8)
                .frame(maxWidth: .infinity)
                .background(
                    
                    LinearGradient(colors: [Color.red,Color.blue], startPoint: .bottomLeading, endPoint: .topTrailing)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(Color.white)
        }
    }
}


struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(category: Category(name: "Men"))
    }
}
