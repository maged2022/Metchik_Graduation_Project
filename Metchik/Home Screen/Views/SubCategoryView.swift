//
//  SubCategoryView.swift
//  Metchik
//
//  Created by Faculty on 12/12/2023.
//

import SwiftUI

struct SubCategoryView: View {
    
    @State var categorie: String
    @State private var subCategoryViewModel = SubCategoryViewModel()
    let categories: [String] = [
        "Men",
        "Women",
        "Kids"
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    ForEach(categories, id: \.self) { item in
                        VStack(spacing: 10) {
                            Text(item)
                                .font(.title2)
                                .fontWeight(item == categorie ? .bold : .regular)
                                .onTapGesture {
                                    categorie = item
                                }

                            Divider()
                                .frame(width: 40, height: 3)
                                .background(.red)
                                .opacity( item == categorie ? 3 : 0)
                        }
                    }
                }
               
                    VStack(alignment: .leading) {
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                ForEach(subCategoryViewModel.subCategories) { subCategory in
                                    
                                    NavigationLink {
                                        // New Screen
                                        ProductView(selectedSubcategory: subCategory)
                                    } label: {
                                        VStack {
                                            Image("\(categorie) \(subCategory.name)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame( height: 200)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                            
                                            Text("\(subCategory.name)")
                                                .font(.headline)
                                        }
                                        
                                    }
                                    
                                    
                                }
                            }
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
