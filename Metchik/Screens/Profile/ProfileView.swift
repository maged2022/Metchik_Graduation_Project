//
//  ProfileView.swift
//  Metchik
//
//  Created by Hassan on 05/05/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack(spacing:30) {
            VStack {
                
                AsyncImage(url: URL(string: viewModel.user.imageURL)) { image in
                    image.image?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100)
                    
                }
                Text("Upload image")
            }
            
            HStack {
                VStack(spacing:30) {
                    Text("Name")
                    Text("gender")
                    Text("Age")
                    Text("Email")
                    
                }
                .padding(.trailing,40)
                .font(.poppins(.semiBold, size: 14))
                .foregroundStyle(Asset.Colors.searchLabelColor.swiftUIColor)
                VStack(alignment:.leading,spacing: 15) {
                    Text(viewModel.user.userName)
                    Divider()
                    HStack {
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 60,height: 30)
                            .foregroundStyle(Asset.Colors.secondaryButtonColor.swiftUIColor)
                            .overlay {
                                HStack {
                                    Image(systemName: "circle.circle.fill")
                                        .foregroundStyle(Asset.Colors.primaryButtonColor.swiftUIColor)
                                    Text("Male")
                                        .font(.poppins(.semiBold, size: 11))
                                        .foregroundStyle(Asset.Colors.primaryButtonColor.swiftUIColor)
                                }
                            }
                        RoundedRectangle(cornerRadius: 5)
                            .stroke()
                            .frame(width: 60,height: 30)
                            .foregroundStyle(
                                Asset.Colors.searchLabelColor.swiftUIColor)
                            .overlay {
                                HStack {
                                    Image(systemName: "circle")
                                        .foregroundStyle(Asset.Colors.searchLabelColor.swiftUIColor)
                                    Text("Male")
                                        .font(.poppins(.semiBold, size: 11))
                                        .foregroundStyle(Asset.Colors.searchLabelColor.swiftUIColor)
                                }
                            }
                        
                    }
                    Text("22 Year")
                    Divider()
                    Text(viewModel.user.email)
                    Divider()
                    
                }
            }
            .padding(.bottom,100)
            
            Button {
                viewModel.logoutButtonPressed()
            } label: {
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                    
                    Text("Log Out")
                        .font(.poppins(.bold, size: 16))
                        .frame(height: 50)
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                .background(Asset.Colors.secondaryButtonColor.swiftUIColor)
                .cornerRadius(10)
            }
        }
        .padding(25)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        if let profileViewModel = DependencyManager.shared.sharedContainer.resolve(ProfileViewModel.self) {
            ProfileView(viewModel: profileViewModel)
        }
    }
}
