//
//  HapticsManager.swift
//  Metchik
//
//  Created by Hassan on 21/02/2024.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    func notification(type : UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style )
        generator.impactOccurred()
    }
}
