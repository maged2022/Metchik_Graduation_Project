//
//  DependencyManager.swift
//  Metchik
//
//  Created by Hassan on 09/03/2024.
//

import Foundation
import Swinject

class DependencyManager {
    
    // MARK: - Properties
    static let shared = DependencyManager()
    let sharedContainer: Container
    private var storeAssempler: Assembler!
    // MARK: - Lifecycle
    init() {
        self.sharedContainer = Container()
    }
    // MARK: - Functions
    func setupAssemplers() {
        storeAssempler = Assembler([CoordinatorAssembly(sharedContainer: sharedContainer),
                                    HomeAssemply(sharedContainer: sharedContainer),
                                    CartAssembly(sharedContainer: sharedContainer)])
    }
}
