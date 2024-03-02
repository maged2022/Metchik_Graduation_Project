//
//  Color.swift
//  Metchik
//
//  Created by Hassan on 01/03/2024.
//

import SwiftUI
import UIKit

extension Color {
    // Convert Color to a string representation
    func toString() -> String {
        if let uiColor = UIColor(self).cgColor.components {
            let red = Double(uiColor[0])
            let green = Double(uiColor[1])
            let blue = Double(uiColor[2])
            let alpha = Double(uiColor[3])
            
            return "Color(red: \(red), green: \(green), blue: \(blue), opacity: \(alpha))"
        }
        
        return ""
    }

    // Convert a string representation back to Color
    static func fromString(_ string: String) -> Color? {
        let regex = try! NSRegularExpression(pattern: #"Color\(red: ([\d.]+), green: ([\d.]+), blue: ([\d.]+), opacity: ([\d.]+)\)"#)
        
        if let match = regex.firstMatch(in: string, range: NSRange(string.startIndex..., in: string)) {
            let red = Double((string as NSString).substring(with: match.range(at: 1))) ?? 0.0
            let green = Double((string as NSString).substring(with: match.range(at: 2))) ?? 0.0
            let blue = Double((string as NSString).substring(with: match.range(at: 3))) ?? 0.0
            let opacity = Double((string as NSString).substring(with: match.range(at: 4))) ?? 1.0
            
            return Color(red: red, green: green, blue: blue, opacity: opacity)
        }
        
        return nil
    }
}
