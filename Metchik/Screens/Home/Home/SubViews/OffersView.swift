//
//  OffersView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct OffersView: View {
    typealias Colors = Asset.Colors

    @EnvironmentObject var vmod: HomeViewModel
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack {
                ForEach(vmod.offers) { offer in
                    OfferCard(offer: offer)
                }
            }
        }
    }
}

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        if let homeViewModel = DependencyManager.shared.sharedContainer.resolve(HomeViewModel.self) {
            OffersView()
                .environmentObject(homeViewModel)
        }
    }
}

struct OfferCard: View {
    typealias Colors = Asset.Colors
    var offer: Offer
    var body: some View {
        VStack(alignment:.leading, spacing: 15) {
            VStack(alignment:.leading, spacing: 10) {
                VStack(alignment:.leading, spacing: 8) {
                    Text(offer.title)
                        .font(.poppins(.bold, size: 25))
                    Text(offer.subTitle)
                        .font(.poppins(.regular, size: 16))
                }
                .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
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
