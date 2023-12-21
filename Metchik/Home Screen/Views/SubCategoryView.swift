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
                
                HStack(spacing: 5) {
                    ForEach(subCategoryViewModel.subCategories) { subCategory in
                        NavigationLink {
                            // New Screen
                            ProductView(selectedSubcategory: subCategory)
                        } label: {
                            VStack {
                                Image("\(categorie) \(subCategory.name)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame( height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                
                                Text("\(subCategory.name)")
                                    .font(.headline)
                                    .bold()
                            }
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: -5, y: -5)
                        }
                    }
                }
                
                // Discount Section
                Spacer().frame(height: 30)
                DiscountView(imageLogoString: "image_discount_two", imageDiscountString: "images-11")
                
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
