//
//  ContentView.swift
//  Metchik
//
//  Created by s on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        
            ScrollView {
                VStack {
                    NavigationLink {
                        MenCategoryView()
                    } label: {
                        VStack {
                            Image("men")
                            Text("Men")
                        }
                       
                    }
                    
                    NavigationLink {
                        WomenCategoryView()
                    } label: {
                        VStack {
                            Image("women")
                            Text("Women")
                        }
                    }
                    
                    NavigationLink {
                        
                        KidCategoryView()
                    } label: {
                        VStack {
                            Image("kid")
                            Text("Kid")
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




struct MenCategoryView: View {
    let categories = ["men", "women", "kid"] // Define your categories here

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
            
                    
                    VStack(alignment: .leading) {
                        Text("Men_Shoes")
                            .font(.headline)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                ForEach(0..<10) { index in
                                    Image("Men_Shoes") // Use actual image names for each category
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 200)
                                        // Use actual image names or URLs for each category
                                        // Example: Image("clothesImageName")
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                   
                // Second Category
                VStack(alignment: .leading) {
                    Text("Men_Clothing")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { index in
                                Image("Men_Clothing") // Use actual image names for each category
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    // Use actual image names or URLs for each category
                                    // Example: Image("clothesImageName")
                            }
                        }
                        .padding(.horizontal)
                    }
                }
               
                // categeory three
                VStack(alignment: .leading) {
                    Text("Men_Accessories")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { index in
                                Image("Men_Accessories") // Use actual image names for each category
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    // Use actual image names or URLs for each category
                                    // Example: Image("clothesImageName")
                            }
                        }
                        .padding(.horizontal)
                    }
                }
               
                
            
        }
       
    }
}



}




struct WomenCategoryView: View {
    let categories = ["men", "women", "kid"] // Define your categories here

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
            
                    
                    VStack(alignment: .leading) {
                        Text("Women CLothing")
                            .font(.headline)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                ForEach(0..<10) { index in
                                    Image("Women CLothing") // Use actual image names for each category
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 200)
                                        // Use actual image names or URLs for each category
                                        // Example: Image("clothesImageName")
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                   
                // Second Category
                VStack(alignment: .leading) {
                    Text("Women shoes")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { index in
                                Image("Women shoes") // Use actual image names for each category
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    // Use actual image names or URLs for each category
                                    // Example: Image("clothesImageName")
                            }
                        }
                        .padding(.horizontal)
                    }
                }
               
                // categeory three
                VStack(alignment: .leading) {
                    Text("Women Accessories")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { index in
                                Image("Women Accessories") // Use actual image names for each category
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    // Use actual image names or URLs for each category
                                    // Example: Image("clothesImageName")
                            }
                        }
                        .padding(.horizontal)
                    }
                }
               
                
            
        }
       
    }
}



}




struct KidCategoryView: View {
    let categories = ["men", "women", "kid"] // Define your categories here

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
            
                    
                    VStack(alignment: .leading) {
                        Text("Kids Clothing")
                            .font(.headline)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                ForEach(0..<10) { index in
                                    Image("Kids Clothing") // Use actual image names for each category
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 200)
                                        // Use actual image names or URLs for each category
                                        // Example: Image("clothesImageName")
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                   
                // Second Category
                VStack(alignment: .leading) {
                    Text("Kids Shoes")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { index in
                                Image("Kids Shoes") // Use actual image names for each category
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    // Use actual image names or URLs for each category
                                    // Example: Image("clothesImageName")
                            }
                        }
                        .padding(.horizontal)
                    }
                }
               
                // categeory three
                VStack(alignment: .leading) {
                    Text("Kids Accessories")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { index in
                                Image("Kids Accessories") // Use actual image names for each category
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    // Use actual image names or URLs for each category
                                    // Example: Image("clothesImageName")
                            }
                        }
                        .padding(.horizontal)
                    }
                }
               
                
            
        }
       
    }
}



}
