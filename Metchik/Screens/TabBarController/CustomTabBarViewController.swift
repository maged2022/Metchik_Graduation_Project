//
//  CustomTabBarViewController.swift
//  Metchik
//
//  Created by Hassan on 10/05/2024.
//

import UIKit
import Combine

class CustomTabBarViewController: UITabBarController {
    let customTabBar = CustomTabBar()
    
    var cancellable = Set<AnyCancellable>()
    var tabBarConstraints: AnchoredConstraints?
    
    let viewModel: CustomTabBarViewModelInterface
    init(viewModel: CustomTabBarViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.viewDidLoad()
        tabBar.isHidden = true
        viewControllers = viewModel.viewControllers
        setupEMTapBar()
        bindSelectedTab()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindTabBarIsHidden()
    }
    
    private func setupEMTapBar() {
        customTabBar.delegate = self
        view.addSubview(customTabBar)
        customTabBar.fillXSuperView()
        tabBarConstraints = customTabBar.makeConstraints(bottomAnchor: view.bottomAnchor)
        customTabBar.setItems(CustomTabBarType.allCases.map { $0.tabBarItem })
    }
    
    private func bindSelectedTab() {
        viewModel.selectedTabPublisher.sink { [weak self] type in
            self?.selectedIndex = type.rawValue
            self?.customTabBar.selectItem(at: type.rawValue)
        }
        .store(in: &cancellable)
    }
    
    private func bindTabBarIsHidden() {
        viewModel.tabBarIsHiddenPublisher
            .sink { [self] hidden in
                self.tabBarConstraints?.bottom?.constant = hidden ? 100 : 0
                
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                    
                    if !hidden {
                        self.customTabBar.isHidden = hidden
                    }
                } completion: { _ in
                    self.customTabBar.isHidden = hidden
                }
                
            }
            .store(in: &cancellable)
    }
}

extension CustomTabBarViewController: CustomTamBarDelegate {
    
    func customTabBar(_ customTabBar: CustomTabBar, didSelect customItem: CustomTabBarItem) {
        selectedIndex = customItem.tag
        viewModel.selectedTab = CustomTabBarType(rawValue: customItem.tag) ?? .home
    }
}
