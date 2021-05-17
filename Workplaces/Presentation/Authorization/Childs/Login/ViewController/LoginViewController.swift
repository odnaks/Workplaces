//
//  LoginViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    
    /// метод, вызываемый при нажатии на кнопку "войти"
    func loginViewController(with model: LoginViewModel)
    
    /// метод, вызываемый при нажатии на кнопку "регистрация"
    func loginViewControllerToRegistration()
}

final class LoginViewController: UIViewController {
    
    // MARK: - Public properties
    
    public weak var delegate: LoginViewControllerDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var emailTextField: InputTextField?
    @IBOutlet private weak var passwordTextField: InputTextField?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickEnter(_ sender: Any) {
        guard let email = emailTextField?.text,
              let password = passwordTextField?.text
        else { return }
        
        let loginViewModel = LoginViewModel(
            email: email,
            password: password
        )
        
        delegate?.loginViewController(with: loginViewModel)
    }
    
    @IBAction private func clickRegistration(_ sender: Any) {
        delegate?.loginViewControllerToRegistration()
    }
}
