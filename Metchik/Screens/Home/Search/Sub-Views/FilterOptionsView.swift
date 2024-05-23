//
//  FilterOptionsView.swift
//  Metchik
//
//  Created by maged on 23/05/2024.
//

import SwiftUI

struct FilterOptionsView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Price Filter") {
                viewModel.sortProductsByPrice()
            }
            Button("Other Filter") {
                viewModel.showFilterView()
            }
            Button("Cancel") {
                viewModel.showFilterOptions = false
            }
        }
        .foregroundColor(.white)
        .font(.poppins(.extraBold, size: 15))
        .background(.black)
        .padding()
    }
}
