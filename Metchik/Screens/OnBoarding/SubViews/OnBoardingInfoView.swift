//
//  OnBoardingInfo.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import SwiftUI

struct OnBoardingInfoView: View {
    let item: OnBoardingItem
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack(spacing: 35) {
            GeometryReader { geometry in
                item.image
                    .resizable()
                    .clipShape(drawSplashImage(geometry: geometry))
                    .scaledToFill()
                    .scaleEffect(isAnimating ? 1 : 0.9)

            }
            VStack(alignment:.leading,spacing: 10) {
                Text(item.title)
                    .font(.poppins(.bold, size: 30))
                    .lineLimit(2)
                    .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
                Text(item.subTitle)
                    .font(.poppins(.regular, size: 15))
                    .lineLimit(2)
                    .foregroundStyle(Asset.Colors.primaryLabelColor.swiftUIColor)
            }
            
        }
        .onAppear(perform: {
                 isAnimating = false
                 withAnimation(.easeOut(duration: 0.5)) {
                     self.isAnimating = true
                 }
             })
    }
}
struct OnBoardingInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        OnBoardingInfoView(
            item: OnBoardingItem(
                image: Asset.Images.onboarding1.swiftUIImage,
                title: "test",
                subTitle: "test"
            )
        )
        .background(Asset.Colors.backgroundScreenColor.swiftUIColor)
    }
}

extension OnBoardingInfoView {
    func drawSplashImage(geometry: GeometryProxy) -> some Shape {
        let width = Int(geometry.size.width)
        let height = (width * 27 ) / 100 + width
        let spacing = 30
        return Path { path in
            path.move(
                to: CGPoint(x: 0, y: spacing))
            
            path.addQuadCurve(
                to: CGPoint(x: spacing, y: 0),
                control: CGPoint(x: 0 , y: 0)
            )

            path.addLine(to: CGPoint(x: width - spacing, y: 0))
            path.addQuadCurve(
                to: CGPoint(x: width , y: spacing),
                control: CGPoint(x: width  , y: 0)
            )
            path.addLine(to: CGPoint(x: width , y: height - spacing * 2 ))
            path.addQuadCurve(
                to: CGPoint(x: width - spacing, y: height - spacing),
                control: CGPoint(x: width , y: height - spacing)
            )
            
            path.addLine(to: CGPoint(x: spacing , y: height  ))
            path.addQuadCurve(
                to: CGPoint(x: 0, y: height - spacing),
                control: CGPoint(x: 0, y: height)
            )
            
        }

    }
}
