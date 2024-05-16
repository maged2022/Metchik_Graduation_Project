//
//  SnackBar.swift
//  Metchik
//
//  Created by maged on 15/05/2024.
//

import SwiftUI

struct SnackBar: View {
    
    let title: String
    let message: String
    let buttonTitle: String
    var onClick: () -> Void
    
    var body: some View {
        VStack(spacing: 13) {
            Asset.Icons.alertIcon.swiftUIImage
                .resizable()
                .frame(width: 33.3, height: 30)
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(Color.black.cornerRadius(40))
                .overlay(
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 10, height: 7)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                    , alignment: .topTrailing
                )
            
                .padding(25)
            
            Text(title)
                .font(.poppins(.bold, size: 24))
            
            Text(message)
                .font(.poppins(.light, size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
            
            Button(action: {
                self.onClick()
            }, label: {
                Text(buttonTitle)
                    .foregroundColor(.white)
                    .font(.poppins(.boldItalic, size: 16))
                    .padding(.horizontal, 25)
                    .frame( height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.black)
                    )
                    .padding(.vertical, 25)
            })
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(15)
    }
}

struct SnackBar_Previews: PreviewProvider {
    static var previews: some View {
        SnackBar(title: "Successful!",
                 message: "You have successfully your Confirm Payment send!",
                 buttonTitle: "continue shopping",
                 onClick: {
        })
    }
}
