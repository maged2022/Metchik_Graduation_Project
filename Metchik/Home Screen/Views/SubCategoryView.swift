//
//  SubCategoryView.swift
//  Metchik
//
//  Created by Faculty on 12/12/2023.
//

import SwiftUI


struct SubCategoryView: View {
    
    @State var categorie: String
    let productType: [String] = ["Shoes" ,"Clothing" ,"Accessories"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                ForEach(0..<3) { Index in
                    VStack(alignment: .leading) {
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                ForEach(0..<10) { _ in
                                    Image("\(categorie) \(productType[Index])")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame( height: 200)
                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                }
                            }
                        }
                        
                        Text("\(categorie) \(productType[Index])")
                            .font(.headline)
                    }
                }
            }
            .navigationTitle(categorie)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.leading)
            
        }.background(Color.gray
            .ignoresSafeArea()
            .opacity(0.2))
    }
    
}


struct CategoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        SubCategoryView(categorie: "Men")
    }
}
