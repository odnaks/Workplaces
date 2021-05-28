//
//  ProfileMenuButton.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

final class ProfileMenuButton: UIButton {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        titleLabel?.font = UIFont.bodyLarge
        setTitleColor(.middleGrey, for: .normal)
        setTitleColor(.black, for: .selected)
        backgroundColor = .clear
        tintColor = .clear
        isExclusiveTouch = true
    }
}
