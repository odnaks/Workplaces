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
    
    @IBOutlet private var nickNameTextField: TextFieldWithCleanButton!
    @IBOutlet private var nameTextField: TextFieldWithCleanButton!
    @IBOutlet private var lastNameTextField: TextFieldWithCleanButton!
    @IBOutlet private var dateTextField: DateField!
    @IBOutlet private var registrationButton: BaseButton!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layoutMargins = .standart
        setupBackNavItem(with: "Регистрация")
        setupKeyboardObservers()
        setupTextFields()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        stopLoading()
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapRegistration(_ sender: Any) {
        startLoading()
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
    
    private func startLoading() {
        activityIndicator?.startAnimating()
        registrationButton.isEnabled = false
    }
    
    private func stopLoading() {
        activityIndicator?.stopAnimating()
        registrationButton.isEnabled = true
    }
    
}
