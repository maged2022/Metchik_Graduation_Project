//
//  ProductDetailView.swift
//  Metchik
//
//  Created by maged on 18/12/2023.
//

import SwiftUI

struct ProductDetailView: View {
    var selectedProduct: Product
    
    
    // Mock data for colors and sizes
    let availableColors = ["AccentColor", "RedColor", "GreenColor"]
    let availableSizes = ["S", "M", "L", "XL"]
    
    @State private var selectedColor: String = ""
    @State private var selectedSize: String = ""
    
    
    
    let description: String = " Premium 100% cotton fabric for softness and breathability Classic 🔥🔥 crew neckline and short sleeves for a timeless look Available in multiple vibrant colors to suit your style Sizes available: XS, S, M, L, XL, XXL 🛍"
    
    @State var compressDescription: Bool = false
    
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    
    var body: some View {
        // Display details about the selected product
        ScrollView {
            
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }else {
                Image(selectedProduct.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(selectedProduct.name)
                        .font(.title)
                    Spacer()
                    VStack {
                        
                        
                        VStack {
                            
                            Button(action: {
                                showActionSheet = true
                            }) {
                                Text("Click Lens 📷")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding(4)
                                    .shadow(color: .black.opacity(1), radius: 10, x: 5, y: 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                            }
                        }
                        .actionSheet(isPresented: $showActionSheet) {
                            ActionSheet(
                                title: Text("Choose Source"),
                                buttons: [
                                    .default(Text("Open Gallery")) {
                                        showImagePicker = true
                                    },
                                    .default(Text("Open Camera")) {
                                        openCamera() // Call the function to open the camera
                                    },
                                    .cancel()
                                ]
                            )
                        }
                        .sheet(isPresented: $showImagePicker) {
                            ImagePicker(sourceType: .photoLibrary) { image in
                                selectedImage = image
                                showImagePicker = false // Dismiss image picker after selecting an image
                            }
                        }
                    }
                    
                }
                
                
                HStack {
                    Text("$\(String(format: "%.2f", selectedProduct.price))")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .strikethrough()
                    
                    Text("$\(String(format: "%.2f", selectedProduct.discountPrice))")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            
            Divider()
                .frame(width: 200, height: 2, alignment: .leading)
                .background(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            
            // Color Selector Table
            VStack(alignment: .leading) {
                HStack {
                    Text("Color:  ")
                        .font(.title2)
                    
                    Text("\(selectedColor)")
                        .font(.title2)
                }
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(availableColors, id: \.self) { color in
                            Button(action: {
                                selectedColor = color
                            }) {
                                ZStack {
                                    Image(selectedProduct.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                    
                                        .overlay(
                                            Circle()
                                                .fill(Color(color)
                                                    .opacity(selectedColor == color ? 0.5 : 0.3))
                                        )
                                    
                                        .overlay(
                                            Circle().stroke(selectedColor == color ? Color.black : Color.clear, lineWidth: 1)
                                        )
                                }
                            }
                            
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .padding()
            
            Divider()
                .frame(width: 200, height: 2, alignment: .leading)
                .background(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // Size Selector Table
            VStack(alignment: .leading) {
                HStack {
                    Text("Size:  ")
                        .font(.title2)
                    
                    Text("\(selectedSize)")
                        .font(.title2)
                        .bold()
                }
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(availableSizes, id: \.self) { size in
                            Button(action: {
                                selectedSize = size
                            }) {
                                Text(size)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(selectedSize == size ? Color.blue : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .padding()
            
            Divider()
                .frame(width: 200, height: 2, alignment: .leading)
                .background(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // Description about product
            VStack(alignment: .leading) {
                Text(description)
                    .font(.title2)
                    .lineLimit(compressDescription ? nil : 2)
                Button {
                    withAnimation(.easeInOut) {
                        compressDescription.toggle()
                    }
                } label: {
                    Text( compressDescription ? "Show less" : "Read more" )
                        .foregroundColor(.blue)
                        .underline()
                }
            }
            .padding()
            // end of scroll view
        }
        
        .navigationBarTitle(selectedProduct.name)
    }
    
    func openCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("Camera is not available")
            return
        }
        
        showImagePicker = true
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(selectedProduct: Product(name: "product Name", imageName: "discount_image4", price: 142.36, discountPrice: 122.36))
    }
}
