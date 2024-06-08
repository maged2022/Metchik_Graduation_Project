//
//  OnBoarding.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import SwiftUI

struct OnBoardingView: View {
    @StateObject var viewModel: OnBoardingViewModel
    @State var pageNumber = 0
    @AppStorage("isShowOnboarding") var isShowOnboarding: Bool = false

    var body: some View {
        VStack(spacing: 35) {
            TabView(selection: $pageNumber) {
                ForEach(viewModel.items.indices, id: \.self) { index in
                    OnBoardingInfoView(item: viewModel.items[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            nextButton
        }
        .padding(15)
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor )
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView(content: {
            if let onBoardingViewModel = DependencyManager.shared.sharedContainer.resolve(OnBoardingViewModel.self) {
                OnBoardingView(viewModel: onBoardingViewModel)
            }
        })
    }
}

extension OnBoardingView {
    var nextButton: some View {
        HStack {

            Spacer()
            Button {
                if pageNumber == viewModel.items.count - 1 {
                    viewModel.nextButtonPressed()
                    isShowOnboarding = true
                } else {
                    pageNumber = (pageNumber + 1)
                }
            } label: {
                Asset.Icons.backIcon.swiftUIImage
                    .resizable()
                    .frame(width: 22.5,height: 15)
                    .foregroundColor(Asset.Colors.primaryButtonColor.swiftUIColor)
                    .frame(width: 60,height: 60)
                    .background(
                     Asset.Colors.secondaryButtonColor.swiftUIColor.cornerRadius(30)
                    )
                    .rotationEffect(.degrees(180))
            }
        }
    }
}
