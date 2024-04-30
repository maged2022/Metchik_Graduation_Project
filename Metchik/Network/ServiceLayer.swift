//
//  ServiceLayer.swift
//  Metchik
//
//  Created by Hassan on 29/04/2024.
//

import Foundation
import Alamofire

public protocol ServiceLayer {
    var baseUrl: String { get }
    var path: String { get }
    var task: Task { get }
    var headers: [String: String] {get}
}
