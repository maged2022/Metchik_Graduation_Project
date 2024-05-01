//
//  VisualTestingView.swift
//  Metchik
//
//  Created by maged on 30/04/2024.
//

import SwiftUI

struct ImageWrapper: Identifiable {
    let id = UUID()
    let image: UIImage?
}

struct VirtualTryButtonView: View {
    
    typealias Colors = Asset.Colors
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @EnvironmentObject var viewModel: ProductDetailViewModel

    var body: some View {
        VStack {
            
            Button {
                showActionSheet = true
            } label: {
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
                            openCamera()
                        },
                        .cancel()
                    ]
                )
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    self.viewModel.pressedTryItButton(personImage: image)
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
