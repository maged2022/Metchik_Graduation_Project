//
//  BackButton.swift
//  Metchik
//
//  Created by Hassan on 03/03/2024.
//

import SwiftUI

struct BackButton: View {
    var router: Router

    var body: some View {
        Button {
            router.dismiss()
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

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(router: AppRouter(navigationController: UINavigationController()))
    }
}
