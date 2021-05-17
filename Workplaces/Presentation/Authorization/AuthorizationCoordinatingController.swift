//
//  AuthorizationCoordinatingController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 14.05.2021.
//

import UIKit

protocol AuthorizationCoordinatingControllerDelegate: class {
    
    /// метод, вызываемый по завершении сценария авторизации
    func authorizationCoordinatingControllerDone()
}

final class AuthorizationCoordinatingController: UIViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: AuthorizationCoordinatingControllerDelegate?

    // MARK: - Private Properties
    
    private let authorizationService: AuthorizationServiceProtocol
    
    private let rootNavigationController: UINavigationController
    private let startViewController: StartViewController
    private let loginViewController: LoginViewController
    private let registrationContainerController: RegistrationContainerController
    private let completedLoginViewController: CompletedAuthorizationViewController
    
    // MARK: - Initialization
    
    init(
        authorizationService: AuthorizationServiceProtocol = ServiceLayer.shared.authorizationService,
        authorizationFabric: AuthorizationFabric
    ) {
        self.authorizationService = authorizationService
        
        self.startViewController = authorizationFabric.getStartViewController()
        self.loginViewController = authorizationFabric.getLoginViewController()
        self.registrationContainerController = authorizationFabric.getRegistrationContainerController()
        self.completedLoginViewController = authorizationFabric.getCompletedLoginViewController()
        self.rootNavigationController = authorizationFabric.getAuthorizationNavigationController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        showStart()
    }
    
    // MARK: - Private methods
    
    private func login(_ model: LoginViewModel) {
        let userCredentials = LoginViewModel.mapToUserCredentials(from: model)
        _ = authorizationService.login(
            with: userCredentials
        ) { result in
            switch result {
            case .success:
                self.routeToCompletedAuthorization()
            case .failure(let error):
                self.loginViewController.showAlert(with: error)
            }
        }
    }
    
    private func setupNavigationController() {
        showChild(rootNavigationController, to: view)
        rootNavigationController.navigationBar.isHidden = true
    }
    
    // MARK: - Routing
    
    private func showStart() {
        startViewController.delegate = self
        rootNavigationController.pushViewController(startViewController, animated: false)
    }
    
    private func routeToLogin() {
        loginViewController.delegate = self
        rootNavigationController.pushViewController(loginViewController, animated: false)
    }
    
    private func routeToRegistration() {
        registrationContainerController.delegate = self
        rootNavigationController.pushViewController(registrationContainerController, animated: true)
    }
    
    private func routeToCompletedAuthorization() {
        completedLoginViewController.delegate = self
        rootNavigationController.pushViewController(completedLoginViewController, animated: true)
    }
}

// MARK: - StartViewControllerDelegate

extension AuthorizationCoordinatingController: StartViewControllerDelegate {
    func startViewControllerToLogin() {
        routeToLogin()
    }
    
    func startViewControllerToRegistration() {
        routeToRegistration()
    }
}

// MARK: - LoginViewControllerDelegate

extension AuthorizationCoordinatingController: LoginViewControllerDelegate {
    func loginViewController(with model: LoginViewModel) {
        login(model)
    }
    
    func loginViewControllerToRegistration() {
        rootNavigationController.popViewController(animated: false)
        routeToRegistration()
    }
}

// MARK: - RegistrationContainerControllerDelegate

extension AuthorizationCoordinatingController: RegistrationContainerControllerDelegate {
    func registrationContainerControllerToLogin() {
        rootNavigationController.popViewController(animated: false)
        routeToLogin()
    }
    
    func registrationContainerControllerRegistration() {
        routeToCompletedAuthorization()
    }
}

// MARK: - CompletedAuthorizationViewControllerDelegate

extension AuthorizationCoordinatingController: CompletedAuthorizationViewControllerDelegate {
    func completedAuthorizationViewControllerDone() {
        delegate?.authorizationCoordinatingControllerDone()
    }
}
