//
//  ProductDetailView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductDetailView: View {
    var selectedProduct: Product
    @State var rating: Int = 4
    
    var productViewModel: ProductViewModel
    
    var body: some View {
        // Display details about the selected product
        
        VStack {
           
            ZStack(alignment: .bottomTrailing) {
                Image("discount_image2")
                    .resizable()
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 430).tag("0")
                    
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        
                        .frame(width: 30,height: 30)
                        .aspectRatio(contentMode: .fill)
                        .background(Color.themeColor.primaryButtonColor
                            .cornerRadius(15)
                        )
                })
                .padding(25)
                .padding(.bottom,25)
                .tag("1")
               
            }
            VStack(alignment: .leading){
                HStack {
                    VStack(alignment:.leading) {
                        Text(selectedProduct.name)
                            .font(.poppins(.semiBold, size: 18))
                            .foregroundStyle(Color
                                .themeColor.primaryLabelColor)
                        Text(selectedProduct.shortDescription)
                            .font(.poppins(.regular, size: 11))
                            .foregroundStyle(Color.themeColor.secondaryLabelColor)
                        HStack(spacing:10) {
                            ForEach(1..<6) {
                                index in
                                Image(systemName: "star.fill")
                                    .foregroundColor(rating >= index ? Color.yellow.opacity(0.5): Color.gray.opacity(0.5))
                                    .frame(width: 12,height: 12)
                                    .scaledToFill()
                                    .onTapGesture {
                                        rating = index
                                    }
                            }
                            Text("(\(selectedProduct.review) Review)")
                                .font(.poppins(.regular, size: 11))
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing:12) {
                        HStack {
                            Button {
                            } label: {
                                Image(systemName: "minus")
                            }
                            Text("1")
                            Button {
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                        .font(.poppins(.regular, size: 14))
                        .foregroundStyle(Color.themeColor.primaryLabelColor)
                        .padding(.vertical,5)
                        .padding(.horizontal,12)
                        .background(Color.themeColor.backgroundSearchColor)
                        .cornerRadius(30)
                        .padding(.top,10)
                        
                        Text("Avaliable in stok")
                            .font(.poppins(.semiBold, size: 11))
                    }
                    
                }
                
                ProductSizeSectionView()
                
                VStack(alignment: .leading,spacing: 15) {
                    Text("Description")
                        .font(.poppins(.semiBold, size: 16))
                        .foregroundColor(.themeColor.primaryLabelColor)
                    
                    Text("Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair.")
                        .font(.poppins(.regular, size: 11))
                        .foregroundColor(.themeColor.secondaryLabelColor)
                }
                .padding(.bottom,30)
                
                HStack(spacing: 50) {
                    VStack(alignment:.leading){
                        Text("Total Price")
                            .font(.poppins(.regular, size: 9))
                            .foregroundColor(.themeColor.borderCategoryColor)
                        Text("$\(String(format: "%.2f", selectedProduct.price))")
                            .font(.poppins(.bold, size: 18))
                            .foregroundColor(.themeColor.primaryLabelColor)
                    }
                    
                    Button(action: {}, label: {
                        Text("Add To Cart")
                            .foregroundColor(.themeColor.primaryButtonColor)
                            .font(.poppins(.semiBold, size: 16))
                            .frame(maxWidth: .infinity)
                            .frame( height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(.themeColor.secondaryButtonColor)
                            )
                        
                    })
                }
            }
            .padding(.vertical,20)
            .padding(.horizontal,25)
            .padding(.bottom,-25)
            .background(Color.themeColor.backgroundScreenColor
                .ignoresSafeArea()
                .cornerRadius(30)
            )
            .offset(y:-30)
        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(selectedProduct: Product(id: "1", name: "T-Shirt", images: ["discount_image4"], price:  142.36, discountPrice:  122.36), productViewModel: ProductViewModel())
        //            .previewLayout(.fixed(width: 500, height: 1500))
    }
}
