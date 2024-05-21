//
//  CategoryButton.swift
//  Metchik
//
//  Created by maged on 21/05/2024.
//

import SwiftUI


struct CategoryButton: View {
    var category: String
    var isSelected: Bool
    var onTap: () -> Void
    
    typealias Colors = Asset.Colors
    
    var body: some View {
        Text(category)
            .font(.poppins(.bold, size: 13))
            .foregroundColor(
                isSelected ? Colors.primaryButtonColor.swiftUIColor : Colors.secondaryButtonColor.swiftUIColor
            )
            .frame(height: 30)
            .padding(.horizontal, 14)
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
        CategoryButton(category: "Dresses", isSelected: true, onTap: {})
    }
}
