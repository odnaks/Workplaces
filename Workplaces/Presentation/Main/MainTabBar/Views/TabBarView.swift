//
//  TabBarView.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

private enum TabBarConstants {
    static let width: CGFloat = 176
    static let height: CGFloat = 60
}

protocol TabBarDelegate: AnyObject {
    /// метод, вызываемый при смены таба
    /// принимает selectedIndex - индекс выбранного таба
    func tabBar(selectedIndex: Int)
    
    /// метод, вызываемый при нажатии на кнопку нового поста
    func tabBarNewPost()
}

final class TabBarView: XibView {
    
    // MARK: - IBOutlet
    
    @IBOutlet private var backgroundView: UIView!
    @IBOutlet private var tabViews: [UIButton]!
    
    // MARK: - Private Properties
    
    private var activeItem: Int = 0
    
    // MARK: - Public Properties
    
    weak var delegate: TabBarDelegate?
    
    // MARK: - Initialization
    
    convenience init(
        menuItems: [TabItem],
        frame: CGRect = CGRect(
            origin: .zero,
            size: CGSize(
                width: TabBarConstants.width,
                height: TabBarConstants.height
            )
        )
    ) {
        self.init(frame: frame)
        
        setupTabs()
        activateTab(tab: activeItem)
    }
    
    // MARK: - Public Methods
    
    /// Метод для форс смены таба на хоум
    func switchToHome() {
        switchTab(from: activeItem, to: 0)
    }
    
    // MARK: - Life Circle
    
    override func layoutSubviews() {
        layer.cornerRadius = 30
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapTab(_ sender: UIButton) {
        switchTab(
            from: activeItem,
            to: sender.tag
        )
    }
    
    @IBAction private func didTapNewPost(_ sender: Any) {
        delegate?.tabBarNewPost()
    }
    
    // MARK: - Private Methods
    
    private func switchTab(from: Int, to: Int) {
        deactivateTab(tab: from)
        activateTab(tab: to)
    }
    
    private func activateTab(tab: Int) {
        let tabToActivate = tabViews[tab]
        
        tabToActivate.tintColor = .orange
        activeItem = tab
        delegate?.tabBar(selectedIndex: tab)
    }
    
    private func deactivateTab(tab: Int) {
        let inactiveTab = tabViews[tab]
        inactiveTab.tintColor = .grey
    }
    
    private func setupTabs() {
        for tab in tabViews {
            tab.tintColor = .grey
        }
    }
    
}
