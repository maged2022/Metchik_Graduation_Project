//
//  Coordinator.swift
//  Metchik
//
//  Created by Hassan on 05/03/2024.
//

import Foundation

protocol Coordinator {
    var router: Router { get }
    
    func start()
}
