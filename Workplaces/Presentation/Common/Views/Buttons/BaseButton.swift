//
//  BaseButton.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 22.04.2021.
//

import UIKit

final class BaseButton: UIButton, Zoomable {

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
        updateUI()
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
    
    override var isEnabled: Bool {
        didSet {
            updateBackgroundColor()
        }
    }
    
    // MARK: - Private methods
    
    private func updateUI() {
        titleLabel?.font = UIFont.bodyLarge
        layer.cornerRadius = 14
        isExclusiveTouch = true
        setTitleColor(.white, for: .normal)
        setTitleColor(.darkGrey, for: .disabled)
        backgroundColor = .orange
    }
    
    private func updateBackgroundColor() {
        backgroundColor = isEnabled ? .orange : .lightGreyBlue
    }

}
