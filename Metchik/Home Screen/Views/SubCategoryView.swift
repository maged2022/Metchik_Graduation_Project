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
                
                // Discount Section
                DiscountView()
                
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


struct Discount: Identifiable {
    let id: UUID = UUID()
    let imageName: String
    let oldPrice: Double
    let newPrice: Double
}

struct DiscountView: View {
    
    let discountList: [Discount] = [
        Discount(imageName: "discount_image1", oldPrice: 514.12, newPrice: 354.21),
        Discount(imageName: "discount_image1", oldPrice: 514.12, newPrice: 354.21),
        Discount(imageName: "discount_image1", oldPrice: 514.12, newPrice: 354.21),
        Discount(imageName: "discount_image1", oldPrice: 514.12, newPrice: 354.21),
        Discount(imageName: "discount_image1", oldPrice: 514.12, newPrice: 354.21),
        Discount(imageName: "discount_image1", oldPrice: 514.12, newPrice: 354.21),
    ]
    
    var body: some View {
        ScrollView {
            
            VStack {
                
                Text("The End of Season Sale is HERE! 🔥 Don’t miss the chance to shop all your Metchik Favorite at discount price with up to 50% OFF.Shop now ")
                
                 // Image Discount logo
                Image("discount_image")
                    .resizable()
                    .scaledToFit()
                
                
                // Image
                ForEach(discountList) { item in
                    VStack{
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                        VStack {
                            
                            Text("$\(String(format: "%.2f", item.newPrice))")
                                .foregroundColor(.gray)
                                .padding(.top, 4)
                            
                            Text("$\(String(format: "%.2f", item.oldPrice))")
                                .foregroundColor(.gray)
                                .padding(.top, 4)
                                .strikethrough() 
                        }
                    }
                }
                
                
                
            }
            
          
        }
    }
}
