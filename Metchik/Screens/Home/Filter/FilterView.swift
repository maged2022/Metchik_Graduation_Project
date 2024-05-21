//
//  FilterView.swift
//  Metchik
//
//  Created by maged on 21/05/2024.
//

import SwiftUI

struct FilterView: View {
    let categories = ["Category 1", "Category 2", "Category 3", "Category 4",
                      "Category 5", "Category 6", "Category 7", "Category 8",
                      "Category 9", "Category 10", "Category 11", "Category 12"]
    
    var body: some View {
        VStack {
            Text("Categories")
                .font(.poppins(.bold, size: 16))
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(categories, id: \.self) { category in
                        CategoryButton(category: category)
                    }
                }
                .background(.red)
                .padding()
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}


import SwiftUI

struct CategoryButton: View {
    var category: String
    
    var body: some View {
        Text(category)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
