//
//  StepperView.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI

struct StepperView: View {
    var body: some View {
        VStack(spacing:12) {
            HStack {
                Button {
                } label: {
                    Image(systemName: "minus")
                }
                Text("1")
                Button {
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
            
            Text("Avaliable in stok")
                .font(.poppins(.semiBold, size: 11))
        }
    }
}

#Preview {
    StepperView()
}
