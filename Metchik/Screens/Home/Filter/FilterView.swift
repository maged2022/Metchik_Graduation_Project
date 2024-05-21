//
//  FilterView.swift
//  Metchik
//
//  Created by maged on 21/05/2024.
//

import SwiftUI

struct FilterView: View {
  
    let spacingBetweenColumns: CGFloat = 5
    let viewModel: FilterViewModel = FilterViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Categories")
                    .font(.poppins(.bold, size: 20))
                Spacer()
            }
            
            
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: spacingBetweenColumns),
                        GridItem(.flexible(), spacing: spacingBetweenColumns),
                        GridItem(.flexible(), spacing: spacingBetweenColumns),
                        GridItem(.flexible(), spacing: spacingBetweenColumns)
                    ],
                    spacing: 20
                ) {
                    ForEach(viewModel.categories, id: \.self) { category in
                        CategoryButton(category: category, isSelected: false) {
                            print("\(category) button clicked")
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 10)
    }
}
struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
