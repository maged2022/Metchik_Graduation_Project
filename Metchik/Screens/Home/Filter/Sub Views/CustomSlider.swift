//
//  CustomSlider.swift
//  Metchik
//
//  Created by maged on 22/05/2024.
//

import SwiftUI

struct CustomSlider: View {
    @State private var lowerValue: Double = 0.0
    @State private var upperValue: Double = 0.5

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
 
            VStack {
                ZStack {
                    // Slider Track
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 3)
                        .padding(.horizontal)
                    
                    // Darker area between thumbs
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.black)
                        .frame(height: 3)
                        
                        .frame(width: width / 2 - 20 )
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        

                    // Lower Thumb
                    Circle()
                        .fill(Color.white)
                        .frame(width: 13, height: 13)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .offset(x: lowerValue * (width - 13))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let newValue = min(max(0, Double(value.location.x / width)), upperValue - 0.01)
                                    lowerValue = newValue
                                }
                        )

                    // Upper Thumb
                    Circle()
                        .fill(Color.white)
                        .frame(width: 13, height: 13)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .offset(x: upperValue * (width - 700))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let newValue = min(max(lowerValue + 0.01, Double(value.location.x / width)), 1)
                                    upperValue = newValue
                                }
                        )
                }
                HStack () {
                    Text("$0")
                    Spacer()
                    Text("$750")
                        .foregroundColor(.black)
                    Spacer()
                    Text("$1750")
                }
                .foregroundColor(.gray)
                .padding(.horizontal, 10)
            }
        }
        .frame(height: 50)
    }
}

struct CustomTwoThumbSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider()
            .frame(height: 100)
    }
}
