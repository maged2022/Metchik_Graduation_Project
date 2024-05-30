//
//  SubCategoryUseCase.swift
//  Metchik
//
//  Created by Hassan on 26/05/2024.
//

import Foundation

protocol SubCategoryRepositories {
    func getSubCategoryImage(category: String, subCategory: String, completion: @escaping (String?) -> Void)
}

class SubCategoryUseCase: SubCategoryRepositories {
    private var repo: SubCategorySourceRepositories = SubCategorySourceRepositoriesImpl()
    static var instance = SubCategoryUseCase()
    private init() {  }
    func getSubCategoryImage(category: String, subCategory: String, completion: @escaping (String?) -> Void) {
        let parameters = [
            "category": category.lowercased(),
            "title": subCategory.lowercased()
        ]
        repo.getSubCategorySourceImage(parameters: parameters) { result in
            switch result {
            case .success(let success):
                completion(success.data.subCategories.first?.imageURL)
            case .failure(let failure):
                print("repo.getSubCategorySourceImage(parameters: parameters) \(failure)")
            }
        }
    }
}
