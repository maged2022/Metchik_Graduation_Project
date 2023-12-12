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


