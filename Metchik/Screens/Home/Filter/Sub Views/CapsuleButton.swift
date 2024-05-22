//
//  CategoryButton.swift
//  Metchik
//
//  Created by maged on 21/05/2024.
//

import SwiftUI


struct CapsuleButton: View {
    let category: String
    let isSelected: Bool
    let padding: CGFloat
    var onTap: () -> Void
    
    typealias Colors = Asset.Colors
    
    var body: some View {
        Text(category)
            .font(.poppins(.bold, size: 13))
            .foregroundColor(
                isSelected ? Colors.primaryButtonColor.swiftUIColor : Colors.secondaryButtonColor.swiftUIColor
            )
            .frame(height: 30)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .padding(.horizontal, padding)
            .background(capsuleBackground)
            .onTapGesture {
                onTap()
            }
    }
    
    private var capsuleBackground: some View {
        if isSelected {
            return AnyView(Capsule().fill(Color.black))
        } else {
            return AnyView(Capsule().stroke(Colors.borderCategoryColor.swiftUIColor, lineWidth: 1))
        }
    }
}


struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButton(category: "Dresses", isSelected: true, padding: 14, onTap: {})
    }
}
