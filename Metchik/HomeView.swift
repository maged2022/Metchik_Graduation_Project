//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            Text("Home Screen")
                .padding()
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
