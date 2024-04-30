//
//  VirtualTryViewModel.swift
//  Metchik
//
//  Created by Hassan on 30/04/2024.
//

import Foundation
import UIKit
class VirtualTryViewModel: ObservableObject {
    let personImage: UIImage
    let productImageURL: URL?
    @Published var virtualImageURL: URL?
    private let coordinator: HomeTabCoordinatorProtocol
    private var virtualTryUseCase: VirtualTryRepositories

    init(personImage: UIImage, productImageURL: URL?, coordinator: HomeTabCoordinatorProtocol, virtualTryUseCase: VirtualTryRepositories) {
        self.personImage = personImage
        self.productImageURL = productImageURL
        self.coordinator = coordinator
        self.virtualTryUseCase = virtualTryUseCase
        uplaodPersonImage()
    }
    
    func uplaodPersonImage() {
        virtualTryUseCase.uploadImageToCloudinary(image: personImage) { imageURL in
            self.getVirtualImage(personImageUrl: imageURL)
        }
    }
    
    func getVirtualImage(personImageUrl: URL) {
        guard let productImageURL else {
            fatalError("can not unwrap productImageURL ")
        }
        virtualTryUseCase.requestVirtualImage(
            personImageURL: personImageUrl,
            productImageURL: productImageURL
        ) { aiImage in
            self.virtualImageURL = aiImage
        }
    }
}
