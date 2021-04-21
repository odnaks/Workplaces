//
//  SocialButton.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 22.04.2021.
//

import UIKit

class SocialButton: UIButton {

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGreyBlue.cgColor
        layer.cornerRadius = 14
//        layer.masksToBounds = true
    }

}
