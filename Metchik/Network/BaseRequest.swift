//
//  BaseRequest.swift
//  Metchik
//
//  Created by Hassan on 29/04/2024.
//

import Foundation
import Alamofire

public protocol Networkable {
     func request<T: Codable>(route: ServiceLayer, method: HTTPMethod, completion: @escaping (Result<T, RemoteError>) -> Void)
}

public class BaseRequest: Networkable {
    public static let shared = BaseRequest()
    public func request<T: Codable>(route: ServiceLayer, method: HTTPMethod, completion: @escaping (Result<T, RemoteError>) -> Void) {
        let headers = Alamofire.HTTPHeaders(route.headers )
        let parameters = extractParameters(task: route.task)
        AF.request(route.baseUrl + route.path, method : method,
                   parameters: parameters.params,
                   encoding: parameters.encoding,
                   headers: headers).responseJSON { response in
            ResponseHandler.responseData(response: response, route: route, completion: completion)
        }
    }
    private func extractParameters(task: Task) -> (params: [String: Any], encoding: ParameterEncoding) {
        switch task {
        case .plainRequest:
            return ([:], URLEncoding.default)
        case .requestWithParameters(let parameters, let encoding):
            return (parameters, encoding)
        }
    }
}
