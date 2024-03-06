//
//  SceneDelegate.swift
//  Metchik
//
//  Created by Hassan on 05/03/2024.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationCoordintor: AppCoordinatorProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationCoordintor = AppCoordinator(window: window)
            window.rootViewController = applicationCoordintor.router.navigationController
            applicationCoordintor.start()
          
            self.applicationCoordintor = applicationCoordintor
            window.makeKeyAndVisible()
        }
    }
}
