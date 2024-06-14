//
//  GradientEffect.swift
//  Metchik
//
//  Created by maged on 14/06/2024.
//

import SwiftUI

struct GradientEffect: View {
    @Binding var scanPosition: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7) ,Color.clear]), startPoint: .top, endPoint: .bottom)
                .frame(height: geometry.size.height )
                .offset(y: scanPosition)
                .animation(.linear(duration: 1.5).repeatForever(autoreverses: true))
        }
    }
}
