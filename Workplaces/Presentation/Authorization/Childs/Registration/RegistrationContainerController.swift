//
//  RegistrationContainerController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import UIKit

protocol RegistrationContainerControllerDelegate: class {
    
    /// метод, вызываемый при нажатии на кнопку "логин"
    func registrationContainerControllerToLogin()
    
    /// метод, вызываемый при нажатии на кнопку "регистрация"
    func registrationContainerControllerRegistration()
}

final class RegistrationContainerController: UIViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: RegistrationContainerControllerDelegate?
    
    // MARK: - Private Properties
    
    private let registrationFirstViewController: RegistrationFirstViewController
    private let registrationSecondViewController: RegistrationSecondViewController
    
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
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChilds()
        showFirst()
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

}

// MARK: - RegistrationFirstViewControllerDelegate

extension RegistrationContainerController: RegistrationFirstViewControllerDelegate {
    func registrationFirstViewControllerToLogin() {
        delegate?.registrationContainerControllerToLogin()
    }
    
    func registrationFirstViewControllerContinue() {
        routeToSecond()
    }
}

// MARK: - RegistrationSecondViewControllerDelegate

extension RegistrationContainerController: RegistrationSecondViewControllerDelegate {
    func registrationSecondViewControllerRegistration() {
        delegate?.registrationContainerControllerRegistration()
    }
}
