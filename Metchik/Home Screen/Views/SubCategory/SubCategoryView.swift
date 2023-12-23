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
                        .padding(.leading)
                    }
                }
                
                Spacer().frame(height: 30)
                ForEach(subCategoryViewModel.subCategories){item in
                    SubCategoryCardView(subCategory: item)
                    
                }
                
            }
            .navigationTitle(categorie)
            .navigationBarTitleDisplayMode(.inline)
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
