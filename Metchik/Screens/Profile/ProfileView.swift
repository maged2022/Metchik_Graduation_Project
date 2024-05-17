//
//  ProfileView.swift
//  Metchik
//
//  Created by Hassan on 05/05/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    @State var genderMale: Bool = true
    @State var genderFemale: Bool = false
    var body: some View {
        
        VStack(spacing:30) {
            VStack {
                
                AsyncImage(url: URL(string: viewModel.user.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100)
                    
                } placeholder: {
                    ProgressView()
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
                        Button {
                            genderMale.toggle()
                            genderFemale.toggle()
                        } label: {
                            GenderView(isSelected: $genderMale, title: "Male")
                                
                            GenderView(isSelected: $genderFemale, title: "Female")
                        }
                    }
                    Text(viewModel.user.age)
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
