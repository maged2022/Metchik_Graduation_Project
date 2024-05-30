//
//  SubCategorySourceRepositories.swift
//  Metchik
//
//  Created by Hassan on 26/05/2024.
//

import Foundation

protocol SubCategorySourceRepositories {
    func getSubCategorySourceImage(parameters: [String: Any], completion: @escaping (Result<MetaSubCategorySource, RemoteError>) -> Void)
}

class SubCategorySourceRepositoriesImpl: SubCategorySourceRepositories {
    func getSubCategorySourceImage(parameters: [String: Any], completion: @escaping (Result<MetaSubCategorySource, RemoteError>) -> Void) {
        let route = EndPoints.getSubCategoryWith(parameters: parameters)
        BaseRequest.shared.request(route: route, method: .get, completion: completion)
    }
}
