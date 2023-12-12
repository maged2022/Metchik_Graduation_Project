//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
    let categories = ["Men", "Women", "Kids"]
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(0..<3) { index in
                    NavigationLink {
                        CategoryView(categorie: categories[index])
                    } label: {
                        VStack {
                            Image(categories[index])
                            Text(categories[index])
                        }
                    }
                }
            }
            .navigationTitle("Metchik 👕👚")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}



struct CategoryView: View {
    @State var categorie: String
    let productType: [String] = ["Shoes" ,"Clothing" ,"Accessories"]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                ForEach(0..<3) { outerIndex in
                    VStack(alignment: .leading) {
                        Text("\(categorie) \(productType[outerIndex])")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                ForEach(0..<10) { index in
                                    Image("\(categorie) \(productType[outerIndex])")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 200)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            
        }
    }
    
}
