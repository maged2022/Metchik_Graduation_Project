//
//  VisualTestingView.swift
//  Metchik
//
//  Created by maged on 30/04/2024.
//

import SwiftUI


struct VistualTestingView: View {
    
    typealias Colors = Asset.Colors
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    
    var body: some View {
        VStack {
            Button(action: {
                showActionSheet = true
            }) {
                
                Image(systemName: "camera.on.rectangle")
                    .font(.system(size: 25))
                    .frame(width: 30,height: 30)
                    .aspectRatio(contentMode: .fill)
                    .background(Colors.primaryButtonColor.swiftUIColor
                        .cornerRadius(15)
                    )
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
                    // Show processing indicator and message
                    //                processingImage = true
                    //
                    //                selectedImage = UIImage(named: "discount8")
                    showImagePicker = false
                    // Simulate processing delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        // Hide processing indicator and message after 3 seconds
                        //                    processingImage = false
                    }
                }
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


struct VisualTestingView_Previews: PreviewProvider {
    static var previews: some View {
        VistualTestingView()
    }
}
