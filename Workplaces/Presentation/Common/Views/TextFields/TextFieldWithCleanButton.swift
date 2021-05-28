//
//  TextFieldWithCleanButton.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

final class TextFieldWithCleanButton: TextFieldWithBorder {
    
    // MARK: - Public methods
    
    override func setupUI() {
        super.setupUI()
        
        setupClearButton()
    }
    
    // MARK: - Private Methods
    
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
    
}
