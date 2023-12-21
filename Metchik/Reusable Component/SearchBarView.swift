//
//  SearchBarView.swift
//  Metchik
//
//  Created by maged on 21/12/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var placeholder: String = "Search"

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField(placeholder, text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding()
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .onTapGesture {
                            UIApplication.shared.dismessKeyboard()
                            searchText = ""
                        }
                    ,
                    alignment: .trailing
                )
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color(.systemGray6))
        .cornerRadius(10)
//        .shadow(color: Color.themeColor.accentColor.opacity(0.2), radius: 10)
    }
}



struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
