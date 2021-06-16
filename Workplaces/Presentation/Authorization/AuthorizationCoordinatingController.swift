//
//  AuthorizationCoordinatingController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 14.05.2021.
//

import UIKit

protocol AuthorizationCoordinatingControllerDelegate: AnyObject {
    
    /// метод, вызываемый по завершении сценария авторизации
    func authorizationCoordinatingControllerDone()
}

final class AuthorizationCoordinatingController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: AuthorizationCoordinatingControllerDelegate?

    // MARK: - Private Properties
    
    private let authorizationService: AuthorizationServiceProtocol
    private let profileService: ProfileServiceProtocol
    private let authorizationFabric: AuthorizationFabric
    
    private let rootNavigationController: UINavigationController
    private let startViewController: StartViewController
    private var loginViewController: LoginViewController
    private var registrationContainerController: RegistrationContainerController
    private let completedLoginViewController: CompletedAuthorizationViewController
    
    // MARK: - Initialization
    
    init(
        authorizationService: AuthorizationServiceProtocol = ServiceLayer.shared.authorizationService,
        profileService: ProfileServiceProtocol = ServiceLayer.shared.profileService,
        authorizationFabric: AuthorizationFabric
    ) {
        self.authorizationService = authorizationService
        self.profileService = profileService
        self.authorizationFabric = authorizationFabric
        
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
    
    // MARK: - Public methods
    
    /// метод, вызываемый из рутового координейтинг контроллера, когда нужно показать стартовый экран
    func routeToStart() {
        rootNavigationController.popToRootViewController(animated: true)
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
                self.showLoginError(error)
            }
        }
    }
    
    private func registration(_ model: RegistrationViewModel) {
        let userCredentials = RegistrationViewModel.mapToUserCredentials(from: model)
        _ = authorizationService.registration(
            with: userCredentials
        ) { result in
            switch result {
            case .success:
                self.updateProfile(model)
            case .failure(let error):
                self.showRegistrationError(error)
            }
        }
    }
    
    private func updateProfile(_ model: RegistrationViewModel) {
        let requestProfile = RegistrationViewModel.mapToRequestProfile(from: model)
        _ = profileService.change(requestProfile) { result in
            switch result {
            case .success:
                self.routeToCompletedAuthorization()
            case .failure:
                self.showRegistrationError(.defaultError)
            }
        }
    }
    
    private func showLoginError(_ error: AuthorizationError) {
        switch error {
        case .emailValidationError:
            self.loginViewController.showEmailError()
        case .passwordValidationError:
            self.loginViewController.showPasswordError()
        default:
            self.loginViewController.showError()
        }
    }
    
    private func showRegistrationError(_ error: AuthorizationError) {
        switch error {
        case .emailValidationError:
            self.registrationContainerController.showEmailError()
        case .passwordValidationError:
            self.registrationContainerController.showPasswordError()
        default:
            self.registrationContainerController.showError()
        }
    }
    
    private func setupNavigationController() {
        showChild(rootNavigationController, to: view)
        rootNavigationController.navigationBar.isHidden = true
    }
    
    // MARK: - Routing
    
    private func showStart() {
        startViewController.delegate = self
        rootNavigationController.pushViewController(startViewController, animated: true)
    }
    
    private func routeToLogin() {
        loginViewController = authorizationFabric.getLoginViewController()
        loginViewController.delegate = self
        rootNavigationController.pushViewController(loginViewController, animated: true)
    }
    
    private func routeToRegistration() {
        registrationContainerController = authorizationFabric.getRegistrationContainerController()
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
        rootNavigationController.popToRootViewController(animated: true)
        routeToRegistration()
    }
}

// MARK: - RegistrationContainerControllerDelegate

extension AuthorizationCoordinatingController: RegistrationContainerControllerDelegate {
    func registrationContainerControllerRegistration(with model: RegistrationViewModel) {
        registration(model)
    }
    
    func registrationContainerControllerToLogin() {
        rootNavigationController.popToRootViewController(animated: true)
        routeToLogin()
    }
}

// MARK: - CompletedAuthorizationViewControllerDelegate

extension AuthorizationCoordinatingController: CompletedAuthorizationViewControllerDelegate {
    func completedAuthorizationViewControllerDone() {
        delegate?.authorizationCoordinatingControllerDone()
    }
}
