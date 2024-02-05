//
//  BasketButtonView.swift
//  Metchik
//
//  Created by maged on 07/01/2024.
//

import SwiftUI

struct BasketButtonView: View {
    
    var numberOfProducts: Int //users has in the cart.
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.trailing, 10)
                .padding(.top, 5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 20, height:20)
                    .background(.black)
                    .cornerRadius(50)
            }
        }
    }
}

struct BasketButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BasketButtonView(numberOfProducts: 1)
    }
}
