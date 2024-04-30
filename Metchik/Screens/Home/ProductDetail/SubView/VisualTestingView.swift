//
//  VisualTestingView.swift
//  Metchik
//
//  Created by maged on 30/04/2024.
//

import SwiftUI


struct ImageWrapper: Identifiable {
    let id = UUID()
    let image: UIImage
}

struct VistualTestingView: View {
    
    typealias Colors = Asset.Colors
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var selectedImage: ImageWrapper? // Use ImageWrapper instead of UIImage
    
    var body: some View {
        VStack {
            Button(action: {
                showActionSheet = true
            }) {
                
                Image(systemName: "camera.on.rectangle")
                    .font(.system(size: 25))
                    .frame(width: 30,height: 30)
                    .aspectRatio(contentMode: .fill)
                    .background(Colors.primaryButtonColor.swiftUIColor.cornerRadius(15))
                    .padding(25)
                    .padding(.bottom,25)
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
                    selectedImage = ImageWrapper(image: image!) // Store the selected image
                    showImagePicker = false
                }
            }
        }
        .fullScreenCover(item: $selectedImage) { imageWrapper in
            if let image = imageWrapper.image {
                ImageView(image: image) // Show the selected image in full screen
            }
        }
    }
    
    func openCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("Camera is not available")
            return
        }
        
        showImagePicker = true
    }
}

// Separate view to display the selected image in full screen
struct ImageView: View {
    let image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .navigationBarTitle("Selected Image")
            .edgesIgnoringSafeArea(.all) // Ignore safe area to cover the entire screen
    }
}

