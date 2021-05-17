//
//  RegistrationSecondViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import UIKit

protocol RegistrationSecondViewControllerDelegate: class {
    /// метод, вызываемый при нажатии на кнопку "зарегистрироваться"
    func registrationSecondViewControllerRegistration()
}

final class RegistrationSecondViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: RegistrationSecondViewControllerDelegate?

    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - IBAction
    
    @IBAction private func clickRegistration(_ sender: Any) {
        delegate?.registrationSecondViewControllerRegistration()
    }
    
}
