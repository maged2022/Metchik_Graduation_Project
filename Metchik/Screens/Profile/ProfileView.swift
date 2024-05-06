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
        Button {
            viewModel.logoutButtonPressed()
        } label: {
           Text("logout")
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        if let profileViewModel = DependencyManager.shared.sharedContainer.resolve(ProfileViewModel.self) {
            ProfileView(viewModel: profileViewModel)
        }
    }
}
