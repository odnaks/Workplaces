//
//  TextFieldWithBorder.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 26.05.2021.
//

import UIKit

class TextFieldWithBorder: UITextField, Shakeable {
    enum Status: Int {
        case normal
        case withError
    }
    
    // MARK: - Public properties
    
    /// текущий статус для текст филда. может быть нормальным и с ошибкой
    var status: Status = .normal {
        didSet {
            updateBorder()
            if status == .withError {
                shake()
            }
        }
    }
    
    // MARK: - Private properties
    
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
    
    // MARK: - Public methods
    
    func setupUI() {
        borderStyle = .none
        border.frame = CGRect(
            x: 0,
            y: bounds.height - 1,
            width: bounds.width,
            height: 1
        )
        border.backgroundColor = .lightGreyBlue
        addSubview(border)
        
        let placeholderAttribute = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.middleGrey,
                NSAttributedString.Key.font: UIFont.bodyLarge
            ]
        )
        attributedPlaceholder = placeholderAttribute
        textColor = .black
        
        addTarget(self, action: #selector(handleEditing), for: .allEditingEvents)
    }
    
    // MARK: - Private Methods
    
    @objc private func handleEditing() {
        status = .normal
        updateBorder()
    }
    
    private func updateBorder() {
        let textColor: UIColor = status == .normal ? .black : .orange
        let borderColor: UIColor = status == .normal ? .lightGreyBlue : .orange
        UIView.animate(withDuration: 0.25) {
            self.textColor = textColor
            self.border.backgroundColor = borderColor
        }
    }
}
