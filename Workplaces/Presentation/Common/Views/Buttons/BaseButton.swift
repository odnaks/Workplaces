//
//  BaseButton.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 22.04.2021.
//

import UIKit

final class BaseButton: UIButton, Zoomable {

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        titleLabel?.font = UIFont.bodyLarge
        setTitleColor(.white, for: .normal)
        backgroundColor = .orange
        layer.cornerRadius = 14
    }
    
    // MARK: - Private properties
    
    override var isHighlighted: Bool {
        didSet {
            if oldValue == false && isHighlighted {
                zoomOut()
            } else if oldValue == true && !isHighlighted {
                zoomIn()
            }
        }
    }

}
