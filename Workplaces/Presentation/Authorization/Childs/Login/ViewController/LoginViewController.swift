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
    
    @IBOutlet private var emailTextField: InputTextField!
    @IBOutlet private var passwordTextField: InputTextField!
    @IBOutlet private var enterButton: UIButton!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Public methods
    
    /// Метод, вызываемый при получении с сервера ошибки о валидации email
    func showEmailError() {
        activityIndicator?.stopAnimating()
        emailTextField.status = .withError
    }
    
    /// Метод, вызываемый при получении с сервера ошибки о валидации пароля
    func showPasswordError() {
        activityIndicator?.stopAnimating()
        passwordTextField.status = .withError
    }
    
    /// Метод, вызываемый при получении с сервера ошибки
    func showError() {
        activityIndicator?.stopAnimating()
        emailTextField.status = .withError
        passwordTextField.status = .withError
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layoutMargins = .standart
        setupBackNavItem(with: "Вход")
        setupKeyboardObservers()
        activityIndicator?.stopAnimating()
        
        setupTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Private methods
    
    private func setupTextFields() {
        emailTextField.textContentType = .emailAddress
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapEnter(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        
        let loginViewModel = LoginViewModel(
            email: email,
            password: password
        )
        activityIndicator?.startAnimating()
        delegate?.loginViewController(with: loginViewModel)
    }
    
    @IBAction private func didTapRegistration(_ sender: Any) {
        delegate?.loginViewControllerToRegistration()
    }
}
