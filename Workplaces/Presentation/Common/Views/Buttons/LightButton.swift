//
//  LightButton.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

final class LightButton: UIButton {

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        titleLabel?.font = UIFont.bodyLarge
        setTitleColor(.orange, for: .normal)
        backgroundColor = .clear
    }

}
