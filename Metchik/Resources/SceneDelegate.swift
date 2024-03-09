//
//  SceneDelegate.swift
//  Metchik
//
//  Created by Hassan on 05/03/2024.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: sceneWindow)
        DependencyManager.shared.setupAssemplers()
        self.window = window
        DependencyManager.shared.sharedContainer.resolve(AppCoordinatorProtocol.self)?.startApp(window: window)
    }
}
