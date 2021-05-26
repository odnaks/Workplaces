//
//  InputDateField.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 18.05.2021.
//

import UIKit

final class InputDateField: UITextField {
    
    // MARK: - Public properties
    
    /// Дата, записанная в инпут с дата пикера при нажатии на кнопку подтвердить
    var date: Date?
    
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
    
    // MARK: - Private Methods
    
    private func setupUI() {
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
        
        setupRightButton()
        setupDatePicker()
    }
    
    private func setupRightButton() {
        rightViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage.iconCalendar
        imageView.image = image
        rightView = imageView
    }
    
    private func setupDatePicker() {
        let datePicker = UIDatePicker(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        datePicker.datePickerMode = .date
        inputView = datePicker
        
        let toolBar = UIToolbar(
            frame: CGRect(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: 44
            )
        )
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let cancelBarButton = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(cancelPressed)
        )
        let doneBarButton = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(donePressed)
        )
        toolBar.setItems(
            [cancelBarButton, flexibleSpace, doneBarButton],
            animated: false
        )

        inputAccessoryView = toolBar
    }
    
    @objc func cancelPressed() {
        resignFirstResponder()
    }
    
    @objc func donePressed() {
        guard let datePicker = inputView as? UIDatePicker
        else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        text = dateFormatter.string(from: datePicker.date)
        date = datePicker.date
        
        resignFirstResponder()
    }
    
}
