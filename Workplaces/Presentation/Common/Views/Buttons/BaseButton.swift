//
//  BaseButton.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 22.04.2021.
//

import UIKit

class BaseButton: UIButton {

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        titleLabel?.font = UIFont.bodyLarge
        setTitleColor(.white, for: .normal)
        backgroundColor = .orange
        layer.cornerRadius = 14
//        layer.masksToBounds = true
    }

}
