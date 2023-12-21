//
//  UIApplication.swift
//  Metchik
//
//  Created by maged on 21/12/2023.
//

import Foundation
import UIKit

extension UIApplication {
    func dismessKeyboard () {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
