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

    @Published var showAlert = false
    @Published var alertMessage: String = ""
    
    init(personImage: UIImage, productImageURL: URL?, coordinator: HomeTabCoordinatorProtocol, virtualTryUseCase: VirtualTryRepositories) {
        self.personImage = personImage
        self.productImageURL = productImageURL
        self.coordinator = coordinator
        self.virtualTryUseCase = virtualTryUseCase
        uplaodPersonImage()
    }
    
    func uplaodPersonImage() {
        virtualTryUseCase.uploadImageToCloudinary(image: personImage) {[weak self] result in
            switch result {
            case .success(let success):
                self?.getVirtualImage(personImageUrl: success)
            case .failure(let failure):
                DispatchQueue.main.async {
                    self?.showAlert = true
                    self?.alertMessage = failure.description
                }
            }
        }
    }
    
    func getVirtualImage(personImageUrl: URL) {
        guard let productImageURL = productImageURL else {
            fatalError("can not unwrap productImageURL ")
        }
        virtualTryUseCase.requestVirtualImage(
            personImageURL: personImageUrl,
            productImageURL: productImageURL
        ) {  [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self?.virtualImageURL = success
                case .failure(let failure):
                    self?.showAlert = true
                    self?.alertMessage = failure.description
                }
            }
        }
    }
}
