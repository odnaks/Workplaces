//
//  RegistrationFirstViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import UIKit

protocol RegistrationFirstViewControllerDelegate: class {
    
    /// метод, вызываемый при нажатии на кнопку "логин"
    func registrationFirstViewControllerToLogin()
    
    /// метод, вызываемый при нажатии на кнопку "далее"
    func registrationFirstViewControllerContinue()
}

final class RegistrationFirstViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: RegistrationFirstViewControllerDelegate?
    
    // MARK: - IBAction
    
    @IBAction private func clickLogin(_ sender: Any) {
        delegate?.registrationFirstViewControllerToLogin()
    }
    
    @IBAction private func clickContinue(_ sender: Any) {
        delegate?.registrationFirstViewControllerContinue()
    }
    
}
