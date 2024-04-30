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
    
    public var headers: [String : String] {
        switch self {
        case .getVirtualImageWith:
           return ["Content-Type": "application/json"]
        default:
            return [:]
        }
    }

    public var baseUrl: String {
        switch self {
        case .getVirtualImageWith:
            return "https://0517-197-59-122-223.ngrok-free.app/"
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
            return "process_images"
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
        }
    }
}
