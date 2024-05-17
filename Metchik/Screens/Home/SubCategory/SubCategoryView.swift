//
//  SubCategoryView.swift
//  Metchik
//
//  Created by hassan on 12/12/2023.
//

import SwiftUI

struct SubCategoryView: View {
    @StateObject var subCategoryViewModel: SubCategoryViewModel
    var body: some View {
        ScrollView {
            VStack(spacing:0) {
                searchBarButton
                  .padding(.vertical,20)
                SubCategoryCardView()
            }
        }
        .animation(.spring())
        .padding(.horizontal,25)
        .frame(maxWidth: .infinity)
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor
            .ignoresSafeArea()
            )
        .environmentObject(subCategoryViewModel)

    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            if let subCategoryViewModel = DependencyManager.shared.sharedContainer.resolve(SubCategoryViewModel.self) {
                SubCategoryView(subCategoryViewModel: subCategoryViewModel)
            }
        }
    }
}

extension SubCategoryView {
    private var searchBarButton: some View {
        Button(action: {
            subCategoryViewModel.showSearchView()
        }) {
            SearchBarView(searchText: .constant(""))
                .disabled(true)
        }
    }
}
