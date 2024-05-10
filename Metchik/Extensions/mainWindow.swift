//
//  mainWindow.swift
//  Metchik
//
//  Created by Hassan on 10/05/2024.
//

import UIKit
public extension UIApplication {
    var mainWindow: UIWindow? {
        connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .flatMap {
                $0.windows
            }
            .first {
                $0.isKeyWindow
            }
    }
}
