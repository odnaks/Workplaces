//
//  MainTabBarController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

protocol MainTabBarControllerDelegate: AnyObject {
    
    /// метод, вызываемый при нажатии на кнопку нового поста
    func mainTabBarControllerNewPost()
}

final class MainTabBarController: UITabBarController {
    
    // MARK: - Public Properties
    
    weak var mainTabBarDelegate: MainTabBarControllerDelegate?
    
    // MARK: - Private Properties
    
    private var customTabBar: TabBarView?
    
    // MARK: - Public Methods
    
    /// Метод для конфигурации контроллеров в MainTabBarController
    func setup(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
    
    /// Метод для форс смены таба на хоум
    func switchToHome() {
        customTabBar?.switchToHome()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTabBar()
    }
    
    // MARK: - Private Methods
    
    private func loadTabBar() {
        let tabItems: [TabItem] = TabItem.allCases
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
        view.layoutIfNeeded()
    }
}

// MARK: - TabBarDelegate

extension MainTabBarController: TabBarDelegate {
    func tabBarNewPost() {
        mainTabBarDelegate?.mainTabBarControllerNewPost()
    }
    
    func tabBar(selectedIndex: Int) {
        self.selectedIndex = selectedIndex
    }
}
