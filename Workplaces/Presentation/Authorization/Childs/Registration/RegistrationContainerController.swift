//
//  RegistrationContainerController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import UIKit

protocol RegistrationContainerControllerDelegate: AnyObject {
    
    /// метод, вызываемый при нажатии на кнопку "логин"
    func registrationContainerControllerToLogin()
    
    /// метод, вызываемый при нажатии на кнопку "регистрация"
    func registrationContainerControllerRegistration(with model: RegistrationViewModel)
}

final class RegistrationContainerController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: RegistrationContainerControllerDelegate?
    
    // MARK: - Private Properties
    
    private let registrationFirstViewController: RegistrationFirstViewController
    private let registrationSecondViewController: RegistrationSecondViewController
    private var registrationViewModel: RegistrationViewModel?
    
    // MARK: - Initialization
    
    init(
        registrationFabric: RegistrationFabric
    ) {
        self.registrationFirstViewController = registrationFabric.getRegistrationFirstViewController()
        self.registrationSecondViewController = registrationFabric.getRegistrationSecondViewController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    /// Метод, вызываемый при получении с сервера ошибки о валидации email
    func showEmailError() {
        routeToFirst()
        registrationFirstViewController.showEmailError()
    }
    
    /// Метод, вызываемый при получении с сервера ошибки о валидации пароля
    func showPasswordError() {
        routeToFirst()
        registrationFirstViewController.showPasswordError()
    }
    
    /// Метод, вызываемый при получении с сервера ошибки
    func showError() {
        routeToFirst()
        registrationFirstViewController.showError()
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChilds()
        showFirst()
        setupBackNavItem(with: "Регистрация")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Private Methods
    
    private func setupChilds() {
        registrationFirstViewController.delegate = self
        registrationSecondViewController.delegate = self
    }
    
    private func showFirst() {
        showChild(registrationFirstViewController, to: view)
    }
    
    private func routeToSecond() {
        navigationController?.pushViewController(registrationSecondViewController, animated: true)
    }
    
    private func routeToFirst() {
        navigationController?.popViewController(animated: true)
    }

}

// MARK: - RegistrationFirstViewControllerDelegate

extension RegistrationContainerController: RegistrationFirstViewControllerDelegate {
    func registrationFirstViewControllerContinue(with email: String, and password: String) {
        registrationViewModel = RegistrationViewModel(email: email, password: password)
        routeToSecond()
    }
    
    func registrationFirstViewControllerToLogin() {
        delegate?.registrationContainerControllerToLogin()
    }
}

// MARK: - RegistrationSecondViewControllerDelegate

extension RegistrationContainerController: RegistrationSecondViewControllerDelegate {
    func registrationSecondViewControllerRegistration(
        nickName: String?,
        firstName: String?,
        lastName: String?,
        birthday: Date?
    ) {
        guard var model = registrationViewModel else { return }
        model.nickName = nickName
        model.firstName = firstName
        model.lastName = lastName
        model.birthday = birthday
        
        delegate?.registrationContainerControllerRegistration(with: model)
    }
}
