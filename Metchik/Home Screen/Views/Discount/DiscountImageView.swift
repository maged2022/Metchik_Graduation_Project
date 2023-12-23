//
//  DiscountImageView.swift
//  Metchik
//
//  Created by Faculty on 23/12/2023.
//

import SwiftUI

struct DiscountImageView: View {
    let imageDiscountString: String
    var body: some View {
        
        Image(imageDiscountString)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: -5)
            
    }
}

struct DiscountImageView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountImageView(imageDiscountString: "discount_image_one")
    }
}

