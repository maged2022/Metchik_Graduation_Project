//
//  BackButton.swift
//  Metchik
//
//  Created by Hassan on 03/03/2024.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presintationmode

    var body: some View {
        Button {
                 presintationmode.wrappedValue.dismiss()
             } label: {
                 Asset.Icons.backIcon.swiftUIImage
                     .resizable()
                     .frame(width: 18,height: 12)
                     .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                     .frame(width: 35,height: 35)
                     .background(
                      Asset.Colors.secondaryButtonColor.swiftUIColor.cornerRadius(20)
                     )
      
             }
    }
}

//#Preview {
//    BackButton()
//}
