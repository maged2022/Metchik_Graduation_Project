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
    case getVirtualImageWith(parameters: [String: Any])
    case getUserData
    
    public var baseUrl: String {
        switch self {
        case .getVirtualImageWith:
            return "https://242b-197-59-36-82.ngrok-free.app/"
        default :
            return "https://metchik.onrender.com/api/"
        }
    }
    public var path: String {
        switch self {
        case .getProductsWith:
           return "products"
        case .getProductDetailWith:
            return "ProductContain"
        case .getVirtualImageWith:
            return ""
        case .getUserData:
            return "users/66355d4bba75412dfc1a829a"
        }
    }
    
    public var task: Task {
        switch self {
        case .getProductsWith(let parameters):
               return .requestWithParameters(parameters: parameters, encoding: URLEncoding.default)
        case .getProductDetailWith(let parameters):
              return .requestWithParameters(parameters: parameters, encoding: URLEncoding.default)
        case .getVirtualImageWith(let parameters):
              return .requestWithParameters(parameters: parameters, encoding: URLEncoding.default)
        case .getUserData:
            return .plainRequest
        }
    }
}
