//
//  StarView.swift
//  Metchik
//
//  Created by maged on 22/05/2024.
//

import SwiftUI

struct StarView: View {
    
    var rating: Double
    let numberOfStars: Int
    typealias Colors = Asset.Colors
    let sizeOfStar: CGFloat
    let starButtonClicked: () -> Void
    
    var body: some View {
        HStack(spacing:10) {
            ForEach(1..<(numberOfStars + 1)) { index in
                Image(systemName: "star.fill")
                    .foregroundColor((Int(rating) >= index ? Colors.starYellowColor.swiftUIColor : .gray))
                    .frame(width: sizeOfStar,height: sizeOfStar)
                    .scaledToFill()
                    .onTapGesture {
                        // rating = Double(index)
                        starButtonClicked()
                    }
            }
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(rating: 5, numberOfStars: 5, sizeOfStar: 12, starButtonClicked: {})
    }
}
