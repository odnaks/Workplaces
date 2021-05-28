//
//  RegistrationFirstViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import UIKit

protocol RegistrationFirstViewControllerDelegate: AnyObject {
    
    /// метод, вызываемый при нажатии на кнопку "логин"
    func registrationFirstViewControllerToLogin()
    
    /// метод, вызываемый при нажатии на кнопку "далее"
    func registrationFirstViewControllerContinue(with email: String, and password: String)
}

final class RegistrationFirstViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private var emailTextField: TextFieldWithCleanButton!
    @IBOutlet private var passwordTextField: TextFieldWithCleanButton!
    @IBOutlet private var continueButton: BaseButton!
    
    // MARK: - Public Properties
    
    weak var delegate: RegistrationFirstViewControllerDelegate?
    
    // MARK: - Public methods
    
    /// Метод, вызываемый при получении с сервера ошибки о валидации email
    func showEmailError() {
        emailTextField.status = .withError
    }
    
    /// Метод, вызываемый при получении с сервера ошибки о валидации пароля
    func showPasswordError() {
        passwordTextField.status = .withError
    }
    
    /// Метод, вызываемый при получении с сервера ошибки
    func showError() {
        showEmailError()
        showPasswordError()
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layoutMargins = .standart
        setupBackNavItem(with: "Регистрация")
        setupKeyboardObservers()
        
        setupTextFields()
        continueButton.isEnabled = false
    }
    
    // MARK: - Private methods
    
    private func setupTextFields() {
        emailTextField.textContentType = .emailAddress
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
    }

    // MARK: - IBAction
    
    @IBAction private func textFieldEditingChanged(_ sender: Any) {
        let emailIsEmpty = emailTextField.text?.isEmpty ?? true
        let passwordIsEmpty = passwordTextField.text?.isEmpty ?? true
        if !emailIsEmpty && !passwordIsEmpty {
            continueButton.isEnabled = true
        } else {
            continueButton.isEnabled = false
        }
    }
    
    @IBAction private func didTapLogin(_ sender: Any) {
        delegate?.registrationFirstViewControllerToLogin()
    }
    
    @IBAction private func didTapContinue(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else {
              showError()
              return
        }
        
        delegate?.registrationFirstViewControllerContinue(with: email, and: password)
    }
    
}
