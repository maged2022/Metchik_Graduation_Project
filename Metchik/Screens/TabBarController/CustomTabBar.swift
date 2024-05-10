//
//  CustomTabBar.swift
//  Metchik
//
//  Created by Hassan on 10/05/2024.
//

import UIKit

protocol CustomTamBarDelegate: AnyObject {
    // called when a new view is selected by the user (but not programmatically)
    func customTabBar(_ customTabBar: CustomTabBar, didSelect customItem: CustomTabBarItem)
}

class CustomTabBar: UIView {
    // MARK: - subviews
    //
    private let stackView: UIStackView = UIStackView()
    private var tapGestures: [UITapGestureRecognizer] = []
    // MARK: - properties
    //
    private(set) var customItems: [CustomTabBarItem] = []
    weak private(set) var selectedItem: CustomTabBarItem?
    
    weak var delegate: CustomTamBarDelegate?
    
    // MARK: - Initializer
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public func selectItem(at index: Int) {
        let item = customItems[index]
        self.select(item)
    }
    
    // MARK: - setup subviews
    //
    private func setup() {
        backgroundColor = Asset.Colors.backgroundScreenColor.color
        _ = heightConstraints(46 + (UIApplication.shared.mainWindow?.safeAreaInsets.bottom ?? 20))
        layer.cornerRadius = 12
        setupStackView()
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        addSubview(stackView)
        
        let bottomPadding = (UIApplication.shared.mainWindow?.safeAreaInsets.bottom ?? 0) / 2
        let padding = UIEdgeInsets(top: 0, left: 32, bottom: bottomPadding, right: 32)
        stackView.fillSuperview(padding: padding)
    }
    
    public func setItems(_ items: [UITabBarItem]) {
        for item in items {
            let tabBarItem = CustomTabBarItem(item: item)
            stackView.addArrangedSubview(tabBarItem)
            customItems.append(tabBarItem)
        }
        select(customItems.first)
        addTapGestures()
    }
    
    private func addTapGestures() {
        stackView.arrangedSubviews.forEach { view in
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
            view.addGestureRecognizer(tapGesture)
        }
    }

    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        guard let customItem = sender.view as? CustomTabBarItem else {
            return
        }
        select(customItem)
        delegate?.customTabBar(self, didSelect: customItem)
    }
    
    private func select(_ item: CustomTabBarItem?) {
        selectedItem = item
        for emItem in customItems {
            if item === emItem {
                emItem.select()
            } else {
                emItem.unSelect()
            }
        }
    }
}
