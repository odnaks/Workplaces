//
//  TabBarView.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

private var staticWidth: CGFloat = 176
private var staticHeight: CGFloat = 60

protocol TabBarDelegate: class {
    func selectedTab(_ index: Int)
}

class TabBarView: UIView {
    
    // MARK: - IBOutlet
    
    @IBOutlet private var contentView: UIView?
    @IBOutlet private var tabViews: [UIButton]?
    
    // MARK: - Private Properties
    
    private var activeItem: Int = 0
    
    // MARK: - Public Properties
    
    public weak var delegate: TabBarDelegate?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TabBar", owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    convenience init(menuItems: [TabItem],
                     frame: CGRect = CGRect(origin: .zero, size: CGSize(width: staticWidth, height: staticHeight))) {
        self.init(frame: frame)
        
        activateTab(tab: activeItem)
    }
    
    // MARK: - IBAction
    
    @IBAction private func handleTap(_ sender: UIButton) {
        switchTab(from: activeItem, to: sender.tag)
    }
    
    // MARK: - Private Methods
    
    private func switchTab(from: Int, to: Int) {
        deactivateTab(tab: from)
        activateTab(tab: to)
    }
    
    private func activateTab(tab: Int) {
        guard let tabToActivate = tabViews?[tab] else { return }
        
        tabToActivate.changeColor(.orange)
        activeItem = tab
        delegate?.selectedTab(tab)
    }
    
    private func deactivateTab(tab: Int) {
        guard let inactiveTab = tabViews?[tab] else { return }
        
        inactiveTab.changeColor(.grey)
    }
    
}
