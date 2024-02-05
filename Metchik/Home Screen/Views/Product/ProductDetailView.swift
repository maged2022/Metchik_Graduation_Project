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
    let availableColors = ["Accent", "Red", "Green"]
    let availableSizes = ["XS","S", "M", "L", "XL"]
    
    @State private var selectedColor: String = "Green"
    @State private var selectedSize: String = "XS"
    
    
    
    let description: String = " Premium 100% cotton fabric for softness and breathability Classic 🔥🔥 crew neckline and short sleeves for a timeless look Available in multiple vibrant colors to suit your style Sizes available: XS, S, M, L, XL, XXL 🛍"
    
    @State var compressDescription: Bool = false
    
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var processingImage = false
    
    @State var rating: Int = 4
    
    @State private var showingAlertDetail = false
    
    var productViewModel: ProductViewModel
    
    
    var body: some View {
        // Display details about the selected product
        ScrollView {
            
            if processingImage {
                ProgressView("Processing image using ML")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .frame(height: 400)
                    .scaleEffect(1.4)
                    .padding()
                
            }else {
                // Show the selected image or product image
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: -5)
                } else {
                    Image(selectedProduct.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: -5)

                }
            }
            
            
            
            HStack {
                
                Text(selectedProduct.name)
                    .font(.title)
                    .bold()
                    .shadow(color: .black.opacity(0.7), radius: 10, x: 5, y: 5)
                
                Spacer()
                
                Button(action: {
                    showActionSheet = true
                }) {
                    Text("Click Lens 📷")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
//                        .font(.headline)
                        .fontWeight(.heavy)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray.opacity(0.6), lineWidth: 3)
                                .frame(width: 160, height: 40)
                        )
                        .padding()
                        .shadow(color: .black.opacity(0.7), radius: 10, x: 5, y: 5)
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
                        // Show processing indicator and message
                        processingImage = true
                        
                        selectedImage = UIImage(named: "discount8")
                        showImagePicker = false
                        // Simulate processing delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            // Hide processing indicator and message after 3 seconds
                            processingImage = false
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            
            HStack {
                Text("\(String(format: "%.2f", selectedProduct.price)) L.E")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .strikethrough()
                Spacer().frame(width: 15)
                Text("\(String(format: "%.2f", selectedProduct.discountPrice)) L.E")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.red)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.bottom)
            .padding(.horizontal)
            .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)

            
            HStack {
                Text("Rating: ")
                    .font(.title2)
                    .bold()
                
                ForEach(1..<6) {
                    index in
                    Image(systemName: "star.fill")
                        .font(.title)
                        .foregroundColor(rating >= index ? Color.yellow.opacity(0.5): Color.gray.opacity(0.5))
                        .onTapGesture {
                            rating = index
                        }
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
//            .shadow(color: .black.opacity(0.4), radius: 10, x: 5, y: 5)

            // Color Selector Table
            VStack(alignment: .leading) {
                HStack {
                    Text("Color:  ")
                        .font(.title2)
                        .bold()
                    
                    Text("\(selectedColor)")
                        .font(.title2)
                        .bold()
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
                                        .frame(width: 55, height: 55)
                                    
                                        .overlay(
                                            Circle()
                                                .fill(Color("\(color)Color")
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
            .shadow(color: .black.opacity(0.6), radius: 10, x: 5, y: 5)

            // Size Selector Table
            VStack(alignment: .leading) {
                HStack {
                    Text("Size:  ")
                        .font(.title2)
                        .bold()
                    
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
            .shadow(color: .black.opacity(0.4), radius: 10, x: 4, y: 4)
            
            
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

            // Add product
            HStack {
                Spacer()
                
                Button(action: {
                    
    //                cartmanager.addToCart(product, selectedSize, selectedColor)
                    if productViewModel.basketProducts.contains(selectedProduct) {
                        print("product in the basket...")
                        print("id: \(selectedProduct.id)")
                    }else {
                        print("product not in the basket...")
                        print("id: \(selectedProduct.id)")
                        productViewModel.addProduct(product: selectedProduct)
                    }
                    
                    showingAlertDetail = true
                    
                }, label: {
                    Text("ADD TO Basket")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray.opacity(0.4), lineWidth: 3)
                                .frame(width: 200, height: 40)
                        )
                        .shadow(color: .black.opacity(0.7), radius: 10, x: 5, y: 5)
                })
                
                Spacer()
                
            }
            .padding()
            .padding()
            .alert("Item Added To Cart", isPresented: $showingAlertDetail) {
                Button("OK", role: .cancel) {
                    
                   
                }
            }
            
            // end of scroll view
        }
        .background(Color.gray
            .ignoresSafeArea()
            .opacity(0.2))
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
        ProductDetailView(selectedProduct: Product(id: "1", name: "T-Shirt", imageName: "discount_image4", price:  142.36, discountPrice:  122.36), productViewModel: ProductViewModel())
    }
}
