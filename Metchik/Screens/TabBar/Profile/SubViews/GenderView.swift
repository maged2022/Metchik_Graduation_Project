//
//  GenderView.swift
//  Metchik
//
//  Created by Hassan on 16/05/2024.
//

import SwiftUI

struct GenderView: View {
    @Binding var isSelected: Bool
    let title: String
    var body: some View {

        HStack {
            Image(systemName: isSelected ? "circle.circle.fill" : "circle")
                .foregroundStyle(
                    isSelected ? Asset.Colors.primaryButtonColor.swiftUIColor :
                        Asset.Colors.searchLabelColor.swiftUIColor
                )
                .frame(width: 10,height: 10)
            Text(title)
                .font(.poppins(.semiBold, size: 11))
                .foregroundStyle(
                    isSelected ?  Asset.Colors.primaryButtonColor.swiftUIColor :
                        Asset.Colors.searchLabelColor.swiftUIColor
                )
        }
        .frame(height: 30)
        .padding(.horizontal,8)
        .foregroundStyle(
                isSelected ? Asset.Colors.secondaryButtonColor.swiftUIColor :
                    Asset.Colors.searchLabelColor.swiftUIColor
        )
        .background {
            if isSelected {
                Asset.Colors.secondaryButtonColor.swiftUIColor
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            } else {
                Asset.Colors.searchLabelColor.swiftUIColor
                    .clipShape(RoundedRectangle(cornerRadius: 5).stroke())
            }
        }
        
    }
}

struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView(isSelected: .constant(true), title: "male")
    }
}
