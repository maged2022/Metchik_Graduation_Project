//
//  ProductEndPoint.swift
//  Metchik
//
//  Created by Hassan on 29/04/2024.
//

import Foundation
import Alamofire

public enum EndPoints: ServiceLayer {
    case getProductsWith(parameters: [String: Any])
    case getProductDetailWith(parameters: [String: Any])
    public var path: String {
        switch self {
        case .getProductsWith:
           return "products"
        case .getProductDetailWith:
            return "ProductContain"
        }
    }
    
    public var task: Task {
        switch self {
        case .getProductsWith(let parameters):
                .requestWithParameters(parameters: parameters, encoding: URLEncoding.default)
        case .getProductDetailWith(let parameters):
                .requestWithParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
}
