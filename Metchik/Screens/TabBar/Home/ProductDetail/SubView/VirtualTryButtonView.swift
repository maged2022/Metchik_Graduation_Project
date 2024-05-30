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
                Asset.Icons.screenerIcon.swiftUIImage
                    .resizable()
                    .frame(width: 19.56, height: 16)
                    .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                    .frame(width: 35, height: 35)
                    .background(Asset.Colors.secondaryButtonColor.swiftUIColor.cornerRadius(20))
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
                    showImagePicker = false
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
