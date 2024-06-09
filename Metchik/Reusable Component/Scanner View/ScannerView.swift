//
//  ScannerView.swift
//  Metchik
//
//  Created by maged on 09/06/2024.
//

import SwiftUI

struct ScannerView: View {
    @State private var isScanning = false
    @Binding var scanPosition: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Color.clear
                
                // Rectangle moving
                Rectangle()
                    .fill(Color.blue.opacity(0.5))
                    .frame(height: 3)
                    .offset(y: scanPosition)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true)) {
                            scanPosition = geometry.size.height
                        }
                    }
                
                PartialSquare()
                    .stroke(Color.gray.opacity(1), lineWidth: 3)
                    .frame(width: geometry.size.width, height: geometry.size.width)
            }
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    @State static var scanPosition: CGFloat = 0.0
    
    static var previews: some View {
        ScannerView(scanPosition: $scanPosition)
            .frame(height: 400) // Provide a fixed height for the preview
    }
}
