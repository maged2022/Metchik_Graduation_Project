//
//  CategoryView.swift
//  Metchik
//
//  Created by Faculty on 12/12/2023.
//

import SwiftUI


struct CategoryView: View {
    @State var categorie: String
    let productType: [String] = ["Shoes" ,"Clothing" ,"Accessories"]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                ForEach(0..<3) { outerIndex in
                    VStack(alignment: .leading) {
                        Text("\(categorie) \(productType[outerIndex])")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                ForEach(0..<10) { index in
                                    Image("\(categorie) \(productType[outerIndex])")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 200)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            
        }
    }
    
}


#Preview {
    CategoryView(categorie: "Men")
}
