//
//  PasswordViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 09.06.2021.
//

import UIKit

protocol PasswordViewControllerDelegate: AnyObject {
    
    /// метод, вызываемый после задания пароля
    /// принимает `password` -– пароль пользователя
    func passwordViewController(_ password: String)
}

final class PasswordViewController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: PasswordViewControllerDelegate?
    
    // MARK: - IBOutlet

    @IBOutlet private var textField: UITextField!
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupKeyboardObservers()
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapButton(_ sender: Any) {
        guard let pass = textField.text else { return }
        delegate?.passwordViewController(pass)
    }
    
}
