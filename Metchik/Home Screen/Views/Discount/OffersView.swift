//
//  DiscountView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct OffersView: View {
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack{
                ForEach(1..<5){number in
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .padding(.leading,15)
                        .frame(width: 260,height: 160)
                        .background(
                            Color.red
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
            }
        }
    }
}

struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView()
    }
}
