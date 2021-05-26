//
//  ProfileMenuView.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

protocol ProfileMenuDelegate: AnyObject {
    /// метод, вызываемый при изменения раздела меню.
    /// принимает newState - порядковый номер выбранного раздела
    func profileMenu(newState: Int)
}

final class ProfileMenuView: XibView {
    
    // MARK: - Public Properties
    
    weak var delegate: ProfileMenuDelegate?
    
    // MARK: - Private Properties
    
    @IBOutlet private var bgView: UIView!
    @IBOutlet private var buttons: [UIButton]!
    
    private var currentState: Int = 0
    
    // MARK: - Initialization
    
    override func commonInit() {
        bgView.layer.cornerRadius = 20
        bgView.layer.masksToBounds = true
        
        updateButtonsState()
        delegate?.profileMenu(newState: currentState)
    }
    
    // MARK: - Private Methods
    
    private func updateButtonsState() {
        for button in buttons {
            if button.tag == currentState {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapMenuButton(_ sender: UIButton) {
        currentState = sender.tag
        updateButtonsState()
        
        delegate?.profileMenu(newState: currentState)
    }
    
}
