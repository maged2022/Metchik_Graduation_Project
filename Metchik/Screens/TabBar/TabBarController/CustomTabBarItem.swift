//
//  CustomTabBarItem.swift
//  Metchik
//
//  Created by Hassan on 10/05/2024.
//

import UIKit
import SwiftUI
class CustomTabBarItem: UIView {
    // MARK: - subViews
    //
    private let stackView: UIStackView = UIStackView()
    public let titleLabel = UILabel()
    private let iconView = UIView()
    public let iconImageView = UIImageView()
    
    // MARK: - Properties
    //
    private var widthConstraint: NSLayoutConstraint?
    private let _height: CGFloat = 30
    private let _width: CGFloat = 75
    private var _cornerRadius: CGFloat { _height / 2 }
    
    let item: UITabBarItem
    init(item: UITabBarItem) {
        self.item = item
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - setup subviews
    //
    private func setup() {
        tag = item.tag
        layer.cornerRadius = _cornerRadius
        setupStackView()
        setupIconView()
        setupIconImageView()
        setupTitleLabel()
        addSubViews()
        select()
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
    }
    
    private func setupIconView() {
        iconView.equalSizeConstraints(_height)
        iconView.layer.cornerRadius = _cornerRadius
    }
    
    private func setupIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
    }
    
    private func setupTitleLabel() {
        titleLabel.text = item.title
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = Asset.Colors.primaryLabelColor.color
        titleLabel.textAlignment = .center
    }
    
    // MARK: - add subviews
    //
    private func addSubViews() {
        heightConstraints(_height)
        widthConstraint = widthConstraints(_width)
        
        // add stackView
        addSubview(stackView)
        stackView.fillSuperview()
        
        // add icon, ImageView
        stackView.addArrangedSubview(iconView)
        iconView.addSubview(iconImageView)
        iconImageView.centerInSuperview(size: .init(width: 14, height: 14))
        
        // add title label
        stackView.addArrangedSubview(titleLabel)
    }
    
    // MARK: - Public Methods
    public func select() {
        widthConstraint?.constant = _width
        backgroundColor = Asset.Colors.primaryButtonColor.color
        iconView.backgroundColor =  Asset.Colors.secondaryButtonColor.color
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.iconImageView.image = self?.item.selectedImage
            self?.superview?.layoutIfNeeded()
        }
    }
    
    public func unSelect() {
        widthConstraint?.constant = _height
        backgroundColor = .clear
        iconView.backgroundColor = .clear
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.iconImageView.image = self?.item.image
            self?.superview?.layoutIfNeeded()
        }
    }
}
