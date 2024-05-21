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
    @State private var selectedItem: String = "Dresses"
    
    let dayList: [String] = ["New Today", "New This Week", "Top Sellers"]
    @State var dayListSelected = "New Today"
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
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
                        CategoryButton(category: category, isSelected: selectedItem == category, padding: 14) {
                            print("\(category) button clicked")
                            selectedItem = category
                        }
                    }
                }
            }
            .frame(height: 140 )
            
            
            // Price Range Section
            HStack {
                Text("Price Range")
                    .font(.poppins(.bold, size: 20))
                Spacer()
            }
            
            
            // Sort by Section
            HStack {
                Text("Sort By")
                    .font(.poppins(.bold, size: 20))
                Spacer()
            }
            
            HStack {
                ForEach(dayList, id: \.self) { day in
                    CategoryButton(category: day, isSelected: dayListSelected == day, padding: 14) {
                        print("\(day) button Clicked")
                        dayListSelected = day
                    }
                }
            }
            
            // Rating Section
            HStack {
                Text("Rating")
                    .font(.poppins(.bold, size: 20))
                
                Spacer()
            }
            
            VStack(spacing: 20) {
                ForEach((2..<6).reversed(), id: \.self) { index in
                    StarView(rating: Double(index), numberOfStars: index, sizeOfStar: 20, starButtonClicked: {})
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.horizontal,10)
            
            CategoryButton(category: "Apply Now", isSelected: true, padding: 100) {
                print("button Clickd")
            }
            
            
            
            
            Spacer()
        }
        .padding(.horizontal, 10)
    }
}
struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
