//
//  CartButtonView.swift
//  Metchik
//
//  Created by maged on 07/01/2024.
//

import SwiftUI
import Combine
class CartButtonViewModel: ObservableObject {
    private var cartUseCase: CartRepositories = CartUseCase.instance
    private var cancellables: [String: AnyCancellable] = [:]
    @Published var numberOfProducts: Int = 0
    init() {
        updateCartProductCount()
    }
    private func updateCartProductCount() {
        self.cancellables["updateCartProductCount"]?.cancel()
        let cancellable = AnyCancellable(cartUseCase.getCartProductsCount()
            .sink { [weak self] count in
                self?.numberOfProducts = count
            })
        self.cancellables["updateCartProductCount"] = cancellable
    }
}
struct CartButtonView: View {
    typealias Colors = Asset.Colors

    @StateObject var cartViewModel = CartButtonViewModel()
    
    var body: some View {
//        NavigationLink {
//            CartView(viewModel: CartViewModel())
//        } label: {
            ZStack(alignment: .topTrailing) {
                Colors.backgroundScreenColor.swiftUIColor
                .frame(width: 30,height: 30)
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.1), radius: 10)
                .overlay {
                    Asset.Icons.cartIcon.swiftUIImage
                        .resizable()
                        .frame(width: 13, height: 13)
                }
                
                if cartViewModel.numberOfProducts > 0 {
                    Text("\(cartViewModel.numberOfProducts)")
                        .font(.poppins(.semiBold, size: 7))
                        .foregroundColor(Colors.primaryButtonColor.swiftUIColor)
                        .frame(width: 13, height: 13,alignment: .bottom)
                        .background(Colors.secondaryButtonColor.swiftUIColor)
                        .cornerRadius(13)
                        .offset(y:-4)
                }
            }
//        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView()
    }
}
