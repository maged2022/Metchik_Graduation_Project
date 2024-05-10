//
//  ResponseHandler.swift
//  Metchik
//
//  Created by Hassan on 29/04/2024.
//

import Foundation
import Alamofire

class ResponseHandler<T: Codable> {
    static func responseData(response: AFDataResponse<Any>, route: ServiceLayer, completion: @escaping (Result<T, RemoteError>) -> Void) {
        switch response.result {
        case .success:
            handleSuccessState(response: response, route: route, completion: completion)
        case .failure:
            handleFailureState(response: response, route: route, completion: completion)
        }
    }
    
    private static func handleSuccessState(response: AFDataResponse<Any>, route: ServiceLayer, completion: @escaping (Result<T, RemoteError>) -> Void) {
        guard let data = response.data else { return }

        do {
            let jsonDecoded = try JSONDecoder().decode(T.self, from: data)
            completion(.success(jsonDecoded))
        } catch {
            completion(.failure(.detectError(statusCode: response.response?.statusCode ?? 400)))
        }
    }
    
    private static func handleFailureState(response: AFDataResponse<Any>, route: ServiceLayer, completion: @escaping (Result<T, RemoteError>) -> Void) {
        completion(.failure(.detectError(statusCode: response.response?.statusCode ?? 400)))
    }
}
