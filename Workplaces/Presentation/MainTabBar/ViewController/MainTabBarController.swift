//
//  MainTabBarController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    // MARK: - Private Properties
    
    private var customTabBar: TabBarView?
    private var tabBarHeight: CGFloat = 67.0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTabBar()
    }
    
    // MARK: - Private Methods
    
    private func loadTabBar() {
        let tabItems: [TabItem] = [.feed, .profile]
        setupCustomTabBar(tabItems)
        selectedIndex = 0
    }
    
    private func setupCustomTabBar(_ menuItems: [TabItem]) {
        tabBar.isHidden = true
        let tabBar = TabBarView(menuItems: menuItems)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.clipsToBounds = true
        
        view.addSubview(tabBar)
        
        NSLayoutConstraint.activate([
            tabBar.widthAnchor.constraint(equalToConstant: (tabBar.frame.width)),
            tabBar.heightAnchor.constraint(equalToConstant: (tabBar.frame.height)),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            tabBar.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        customTabBar = tabBar
        customTabBar?.delegate = self
        
        var controllers = [UIViewController]()
        for i in 0 ..< menuItems.count {
            controllers.append(menuItems[i].viewController)
        }
        view.layoutIfNeeded()
        viewControllers = controllers
    }
}

// MARK: - TabBarDelegate

extension MainTabBarController: TabBarDelegate {
    func selectedTab(_ tabIndex: Int) {
        selectedIndex = tabIndex
    }
}
