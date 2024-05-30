//
//  ProductColorsView.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI

struct ProductColorsView: View {
    typealias Colors = Asset.Colors

    @EnvironmentObject var viewModel: ProductDetailViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(viewModel.availableColors,id: \.self) { color in
                    Button(action: {
                        viewModel.selectedColor = color
                    }, label: {
                        color
                            .overlay {
                                if viewModel.selectedColor == color {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .frame(width: 10,height: 10)
                                        .foregroundColor(checkmarkColor(for: color))
                                }
                            }
                            .frame(width: 20, height: 20)
                            .cornerRadius(10)
                    })
                }
            }
        }
        .padding(10)
        .frame(height: 120)
        .background(Color.white
            .cornerRadius(30))
        .shadow(color: .black.opacity(0.1),radius: 10)
    }
    
    func checkmarkColor(for backgroundColor: Color) -> Color {
        let uiColor = UIColor(backgroundColor)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        // Calculate luminance
        let luminance = (0.299 * red + 0.587 * green + 0.114 * blue)

        // Return black or white based on luminance
        return luminance > 0.5 ? .black : .white
    }
}
struct ProductColorsView_Previews: PreviewProvider {
    static var previews: some View {
        if let productDetailViewModel = DependencyManager.shared.sharedContainer.resolve(ProductDetailViewModel.self) {
            ProductColorsView()
                .environmentObject(productDetailViewModel)
        }

    }
}
