//
//  InputTextField.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

final class InputTextField: UITextField {
    
    // MARK: - Subviews
    
    private let border = UIView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        borderStyle = .none
        border.frame = CGRect(x: 0, y: bounds.height - 1, width: bounds.width, height: 1)
        border.backgroundColor = .orange
        border.isUserInteractionEnabled = false
        addSubview(border)
        
        setupClearButton()
        
        addTarget(self, action: #selector(handleEditing), for: .allEditingEvents)
    }
    
    private func setupClearButton() {
        let clearButton = UIButton()
        clearButton.setImage(.iconCloseSmall, for: .normal)
        clearButton.addTarget(self, action: #selector(clickClear), for: .touchUpInside)
        rightView = clearButton
        rightViewMode = .whileEditing
    }
    
    @objc private func clickClear() {
        text = ""
        sendActions(for: .editingChanged)
    }
    
    @objc private func handleEditing() {
        //        updateLabel()
        updateBorder()
    }
    
    private func updateBorder() {
        let borderColor: UIColor = isFirstResponder ? .orange : .lightGreyBlue
        UIView.animate(withDuration: 0.25) {
            self.border.backgroundColor = borderColor
        }
    }
}
