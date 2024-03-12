//
//  StepperView.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI

struct StepperView: View {
    typealias Colors = Asset.Colors
    @Binding var maxAvailableProduct: Int {
        didSet {
            currentStepperValue = 1
        }
    }
    @Binding var currentStepperValue: Int
    var body: some View {
        HStack {
            Button {
                if currentStepperValue > 1 {
                    currentStepperValue -= 1
                }
            } label: {
                Image(systemName: "minus")
            }
            Text("\(currentStepperValue)")
            Button {
                if currentStepperValue < maxAvailableProduct {
                    currentStepperValue += 1
                }
            } label: {
                Image(systemName: "plus")
            }
        }
        .font(.poppins(.regular, size: 14))
        .foregroundStyle(Colors.primaryLabelColor.swiftUIColor)
        .padding(.vertical,5)
        .padding(.horizontal,12)
        .background(Colors.backgroundSearchColor.swiftUIColor)
        .cornerRadius(30)
        .padding(.top,10)
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView(maxAvailableProduct: .constant(10), currentStepperValue: .constant(2))
    }
}
