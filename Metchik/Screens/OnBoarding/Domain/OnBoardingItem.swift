//
//  OnBoardingItem.swift
//  Metchik
//
//  Created by Hassan on 02/05/2024.
//

import SwiftUI

struct OnBoardingItem: Identifiable {
    var id: String = UUID().uuidString
    let image: Image
    let title: String
    let subTitle: String
}

extension Array where Element == OnBoardingItemModel {
    func toItem () -> [OnBoardingItem] {
        self.map { item in
            OnBoardingItem(
                image: ImageAsset(name: item.image).swiftUIImage,
                title: item.title,
                subTitle: item.subTitle
            )
        }
    }
}
