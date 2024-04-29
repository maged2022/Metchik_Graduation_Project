//
//  Task.swift
//  Metchik
//
//  Created by Hassan on 29/04/2024.
//

import Foundation
import Alamofire

public enum Task {
    case plainRequest
    case requestWithParameters(parameters: [String: Any], encoding: ParameterEncoding)
}
