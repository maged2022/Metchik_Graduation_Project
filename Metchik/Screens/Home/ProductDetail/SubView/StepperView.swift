//
//  StepperView.swift
//  Metchik
//
//  Created by Hassan on 24/02/2024.
//

import SwiftUI

struct StepperView: View {
    typealias Colors = Asset.Colors
    @EnvironmentObject var viewModel: ProductDetailViewModel

    var body: some View {
        VStack(spacing:12) {
            HStack {
                Button {
                    if viewModel.currentStepperValue > 1 {
                        viewModel.currentStepperValue -= 1
                    }
                } label: {
                    Image(systemName: "minus")
                }
                Text("\(viewModel.currentStepperValue)")
                Button {
                    if viewModel.currentStepperValue <= viewModel.maxAvailableProduct {
                        viewModel.currentStepperValue += 1
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
            
            Text("Avaliable in stok")
                .font(.poppins(.semiBold, size: 11))
        }
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let homeCoordinator = HomeTabCoordinator(router: router)
        let productDetailViewModel = ProductDetailViewModel(product: Product.mockData, coordinator: homeCoordinator)
    StepperView()
        .environmentObject(productDetailViewModel)
    }
}
