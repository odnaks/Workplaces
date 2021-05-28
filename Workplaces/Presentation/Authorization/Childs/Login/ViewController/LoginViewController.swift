//
//  LoginViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    
    /// метод, вызываемый при нажатии на кнопку "войти"
    func loginViewController(with model: LoginViewModel)
    
    /// метод, вызываемый при нажатии на кнопку "регистрация"
    func loginViewControllerToRegistration()
}

final class LoginViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var delegate: LoginViewControllerDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet private var emailTextField: TextFieldWithCleanButton!
    @IBOutlet private var passwordTextField: TextFieldWithCleanButton!
    @IBOutlet private var enterButton: UIButton!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Public methods
    
    /// Метод, вызываемый при получении с сервера ошибки о валидации email
    func showEmailError() {
        stopLoading()
        emailTextField.status = .withError
    }
    
    /// Метод, вызываемый при получении с сервера ошибки о валидации пароля
    func showPasswordError() {
        stopLoading()
        passwordTextField.status = .withError
    }
    
    /// Метод, вызываемый при получении с сервера ошибки
    func showError() {
        stopLoading()
        emailTextField.status = .withError
        passwordTextField.status = .withError
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layoutMargins = .standart
        setupBackNavItem(with: "Вход")
        setupKeyboardObservers()
        
        setupTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        stopLoading()
        enterButton.isEnabled = false
    }
    
    // MARK: - Private methods
    
    private func setupTextFields() {
        emailTextField.textContentType = .emailAddress
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
    }
    
    private func startLoading() {
        activityIndicator?.startAnimating()
        enterButton.isEnabled = false
    }
    
    private func stopLoading() {
        activityIndicator?.stopAnimating()
        enterButton.isEnabled = true
    }
    
    // MARK: - IBAction
    
    @IBAction private func textFieldEditingChanged(_ sender: Any) {
        let emailIsEmpty = emailTextField.text?.isEmpty ?? true
        let passwordIsEmpty = passwordTextField.text?.isEmpty ?? true
        if !emailIsEmpty && !passwordIsEmpty {
            enterButton.isEnabled = true
        } else {
            enterButton.isEnabled = false
        }
    }
    
    @IBAction private func didTapEnter(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        
        let loginViewModel = LoginViewModel(
            email: email,
            password: password
        )
        startLoading()
        delegate?.loginViewController(with: loginViewModel)
    }
    
    @IBAction private func didTapRegistration(_ sender: Any) {
        delegate?.loginViewControllerToRegistration()
    }
}
