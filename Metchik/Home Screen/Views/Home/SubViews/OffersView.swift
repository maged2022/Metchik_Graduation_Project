//
//  OffersView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct OffersView: View {
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack {
                ForEach(1..<5) { _ /*number*/ in
                    VStack(alignment:.leading, spacing: 15) {
                        VStack(alignment:.leading, spacing: 10) {
                            VStack(alignment:.leading, spacing: 8) {
                                Text("50% Off")
                                    .font(.poppins(.bold, size: 25))
                                Text("On everything today")
                                    .font(.poppins(.regular, size: 16))
                            }
                            Text("With code:FSCREATION")
                                .font(.poppins(.bold, size: 11))
                                .foregroundStyle(Colors.secondaryLabelColor.swiftUIColor)
                        }
                        Button(action: {
                            
                        }, label: {
                            Text("Get Now")
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
                        Image( "OfferBackground")
                            .resizable()
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    )
                }
            }
        }
    }
}

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView()
    }
}
