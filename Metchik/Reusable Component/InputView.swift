//
//  InputView.swift
//  Metchik
//
//  Created by Hassan on 03/05/2024.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.poppins(.semiBold, size: 16))
                .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
            if isSecureField {
                SecureField(placeholder,text: $text)
                    .font(.poppins(.regular, size: 14))
                    .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
            } else {
                TextField(placeholder,text: $text)
                    .font(.poppins(.regular, size: 14))
                    .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
            }
            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    
    static var previews: some View {
        InputView(text: .constant(""), title: "email address", placeholder: "name@example.com")
    }
}
