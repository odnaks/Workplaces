//
//  LoginViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var emailTextField: InputTextField?
    @IBOutlet private weak var passwordTextField: InputTextField?
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView?
    
    // MARK: - Private Properties
    
    private var autorizationService = ServiceLayer.shared.authorizationService

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator?.stopAnimating()
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func clickEnter(_ sender: Any) {
        guard let email = emailTextField?.text, let password = passwordTextField?.text else { return }
        
        activityIndicator?.startAnimating()
        
        autorizationService.authorize(email: email, password: password) { [weak self] result in
            self?.activityIndicator?.stopAnimating()
            switch result {
            case .success:
                self?.navigationController?.pushViewController(CompletedLoginViewController(), animated: true)
            case .failure(let serviceError):
                self?.showAlert(with: serviceError)
            }
        }
    }
    
    deinit {
        print("login deinit")
    }
}
