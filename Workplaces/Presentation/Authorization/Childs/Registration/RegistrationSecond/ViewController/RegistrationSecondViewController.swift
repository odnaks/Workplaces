//
//  RegistrationSecondViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import UIKit

protocol RegistrationSecondViewControllerDelegate: AnyObject {
    /// метод, вызываемый при нажатии на кнопку "зарегистрироваться"
    func registrationSecondViewControllerRegistration(
        nickName: String?,
        firstName: String?,
        lastName: String?,
        birthday: Date?
    )
}

final class RegistrationSecondViewController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: RegistrationSecondViewControllerDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet private var nickNameTextField: InputTextField!
    @IBOutlet private var nameTextField: InputTextField!
    @IBOutlet private var lastNameTextField: InputTextField!
    @IBOutlet private var dateTextField: InputDateField!
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layoutMargins = .standart
        setupBackNavItem(with: "Регистрация")
        setupKeyboardObservers()
        setupTextFields()
    }

    // MARK: - IBAction
    
    @IBAction private func didTapRegistration(_ sender: Any) {
        delegate?.registrationSecondViewControllerRegistration(
            nickName: nickNameTextField.text,
            firstName: nameTextField.text,
            lastName: lastNameTextField.text,
            birthday: dateTextField.date
        )
    }
    
    // MARK: - Private methods
    
    private func setupTextFields() {
        nameTextField.textContentType = .name
        lastNameTextField.textContentType = .familyName
    }
    
}
