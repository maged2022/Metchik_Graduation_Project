//
//  OffersView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct OffersView: View {
    @Binding var offers: [Offer]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack {
                ForEach(offers) { offer in
                    OfferCard(offer: offer)
                }
            }
        }
    }
}

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView(offers: .constant([]))
    }
}

struct OfferCard: View {
    var offer: Offer
    var body: some View {
        VStack(alignment:.leading, spacing: 15) {
            VStack(alignment:.leading, spacing: 10) {
                VStack(alignment:.leading, spacing: 8) {
                    Text(offer.headLine)
                        .font(.poppins(.bold, size: 25))
                    Text(offer.subHeadLine)
                        .font(.poppins(.regular, size: 16))
                }
                Text(offer.promoCode)
                    .font(.poppins(.bold, size: 11))
                    .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
            }
            Button(action: {
                
            }, label: {
                Text(offer.buttonTitle)
                    .font(.poppins(.bold, size: 10))
                    .padding(.horizontal,14)
                    .padding(.vertical,5)
                    .foregroundStyle(Colors.primaryButtonColor.swiftUIColor)
                    .background(Colors.secondaryButtonColor.swiftUIColor)
                    .cornerRadius(30)
            })
        }
        .padding(15)
        .frame(width: 260.0, height: 160.0,alignment: .leading)
        .background(
            offer.backgroundImage
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 20))
        )
    }
}
