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
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                               
                            Text(categories[index])
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .background(
                                    
                                    LinearGradient(colors: [Color.red,Color.blue], startPoint: .bottomLeading, endPoint: .topTrailing)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundStyle(Color.white)
                                
                        }
                    }
                }
            }
            .navigationTitle("Metchik 👕👚")
            
        }
        .background(Color.gray
            .ignoresSafeArea()
            .opacity(0.2))
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}


