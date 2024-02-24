//
//  SearchBarView.swift
//  Metchik
//
//  Created by maged on 21/12/2023.
//

import SwiftUI

struct SearchBarView: View {
    typealias Colors = Asset.Colors
    @Binding var searchText: String
    var placeholder: String = "Search..."
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .scaledToFill()
                    .foregroundColor(Colors.primaryLabelColor.swiftUIColor)
                    .padding(.trailing,8)
                TextField(text: $searchText, label: {
                    Text(placeholder)
                        .font(.poppins(.regular, size: 13))
                        .foregroundStyle(Colors.searchLabelColor.swiftUIColor)
                })
                
            }
            .padding(.horizontal,25)
            .frame(height: 50)
            .background(Colors.backgroundSearchColor.swiftUIColor)
            .cornerRadius(30)
            if true {
                Button {
                    
                } label: {
                    Circle()
                        .frame(width: 50)
                        .overlay {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.white)
                        }
                        .padding(.leading,8)
                    
                }
                
            }
        }
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
