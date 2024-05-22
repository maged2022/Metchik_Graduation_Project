//
//  SearchView.swift
//  Metchik
//
//  Created by maged on 17/05/2024.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchText, filterButtonClicked: {
                print("Filter Button Clicked 😎")
                viewModel.showFilterView()
            })
            .padding()
            // Grid layout to display products
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                    ForEach(viewModel.products) { product in
                        ProductItemView(productItemViewModel: ProductItemViewModel(product: product, coordinator: viewModel.coordinator))
                    }
                }
                .padding()
            }
        }
    }
}
