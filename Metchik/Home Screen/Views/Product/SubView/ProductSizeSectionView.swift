//
//  ProductSizeSectionView.swift
//  Metchik
//
//  Created by Hassan on 11/02/2024.
//

import SwiftUI

struct ProductSizeSectionView: View {
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading) {
                Text("Size")
                    .font(.poppins(.semiBold, size: 16))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(1..<10) { _ in
                            Button(action: {
                            }) {
                                Text("5")
                                
                                    .font(.poppins(.semiBold, size: 14))
                                    .foregroundColor(.themeColor.secondaryLabelColor)
                                    .frame(width: 40, height: 40)
                                    .background(RoundedRectangle(cornerRadius: 25)
                                        .stroke()
                                        .foregroundColor(.themeColor.borderCategoryColor)
                                    )
                            }
                        }
                    }
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(1..<3) { _ in
                        Button(action: {
                        }) {
                            Color.themeColor.greenColor
                                .foregroundColor(.themeColor.secondaryLabelColor)
                                .frame(width: 20, height: 20)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding(10)
            .frame(minHeight: 20,maxHeight: 145)
            .background(Color.white
                .cornerRadius(30))
            .shadow(color: .black.opacity(0.1),radius: 10)
        }
    }
}


#Preview {
    ProductSizeSectionView()
}
