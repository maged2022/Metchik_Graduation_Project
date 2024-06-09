//
//  SnackBar.swift
//  Metchik
//
//  Created by maged on 15/05/2024.
//

import SwiftUI
enum SnackBarType {
    case error
    case authError
    case success
    func description() -> String {
        switch self {
        case .error:
            return "Error!" 
        case .authError:
            return "Error! ,Pleass Login First"
        case .success:
            return "Successful!"
        }
    }
}

enum SnackBarIcon {
    case cart
    case favorite
    case auth
    func image() -> Image {
        switch self {
        case .cart:
           return Asset.Tabbar.cartSelected.swiftUIImage
        case .favorite:
           return Asset.Tabbar.favoriteSelected.swiftUIImage
        case .auth:
           return Asset.Tabbar.profileSelected.swiftUIImage
        }
    }
}

struct SnackBar: View {
    
    let type: SnackBarType
    let message: String
    let icon: SnackBarIcon
    var onClick: () -> Void 
    var onClickLogin: () -> Void = {}
    
    var body: some View {
        VStack(spacing: 13) {
            icon.image()
                .resizable()
                .frame(width: 33.3, height: 30)
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(Color.black.cornerRadius(40))
                .overlay(
                    Image(systemName: type == .success ?  "checkmark" : "xmark")
                        .resizable()
                        .frame(width: 10, height: 7)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .background( type == .success ? .green : .red)
                        .cornerRadius(10)
                    , alignment: .topTrailing
                )
            
                .padding(25)
            
            Text(type.description())
                .font(.poppins(.bold, size: 24))
            
            Text(message)
                .font(.poppins(.light, size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
            
            HStack(spacing:50) {
                Button(action: {
                    self.onClick()
                }, label: {
                    Text(type == .success ? "continue Shopping" : "OK")
                        .foregroundColor(.white)
                        .font(.poppins(.bold, size: 16))
                        .padding(.horizontal, 25)
                        .frame( height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.black)
                        )
                        .padding(.vertical, 25)
            })
                if type == .authError {
                    Button(action: {
                        self.onClickLogin()
                    }, label: {
                        Text("Login Now")
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
            }
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
        SnackBar(type: .authError,
                 message: "You have successfully your Confirm Payment send!",
                 icon: .cart,
                 onClick: {
        }, onClickLogin: {
        })
    }
}
