//
//  RootCoordinatingController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 14.05.2021.
//

import UIKit
import WorkplacesAPI

final class RootCoordinatingController: UIViewController {
    
    // MARK: - Private Properties
    
    private let tokenService: TokenServiceProtocol
    private let securityService: SecurityServiceProtocol
    
    private let authorizationCoordinatingController: AuthorizationCoordinatingController
    private let mainCoordinatingController: MainCoordinatingController
    private let passwordViewController: PasswordViewController
    
    // MARK: - Initialization
    
    init(
        tokenService: TokenServiceProtocol = ServiceLayer.shared.tokenService,
        securityService: SecurityServiceProtocol = ServiceLayer.shared.securitySerice,
        rootFabric: RootFabric
    ) {
        self.tokenService = tokenService
        self.securityService = securityService
        
        self.authorizationCoordinatingController = rootFabric.getAuthorizationCoordinatingController()
        self.mainCoordinatingController = rootFabric.getMainCoordinatingController()
        self.passwordViewController = rootFabric.getPasswordViewController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let protectionState = securityService.getProtectionState()
        if protectionState != .none {
            showPassword(protectionState)
        } else {
            showAuthorization()
        }
    }
    
    // MARK: - Private methods
    
    private func updateToken(
        _ password: String,
        completion: @escaping (Bool) -> Void
    ) {
        let refreshToken = securityService.getRefreshToken(with: password)
        _ = tokenService.refresh(with: refreshToken, completion: completion)
    }
    
    private func showMain() {
        mainCoordinatingController.delegate = self
        showChild(mainCoordinatingController, to: view)
    }
    
    private func showAuthorization() {
        authorizationCoordinatingController.delegate = self
        showChild(authorizationCoordinatingController, to: view)
    }
    
    private func showPassword(_ protectionState: ProtectionState) {
        passwordViewController.delegate = self
        showChild(passwordViewController, to: view)
    }
    
    private func switchToMain() {
        mainCoordinatingController.delegate = self
        switchChild(
            viewControllerToHide: authorizationCoordinatingController,
            viewControllerToShow: mainCoordinatingController,
            containerView: view
        )
    }
    
    private func switchToAuthorization() {
        authorizationCoordinatingController.delegate = self
        switchChild(
            viewControllerToHide: mainCoordinatingController,
            viewControllerToShow: authorizationCoordinatingController,
            containerView: view
        )
        authorizationCoordinatingController.routeToStart()
    }
}

// MARK: - AuthorizationCoordinatingControllerDelegate

extension RootCoordinatingController: AuthorizationCoordinatingControllerDelegate {
    func authorizationCoordinatingControllerDone() {
        switchToMain()
    }
}

// MARK: - MainCoordinatingControllerDelegate

extension RootCoordinatingController: MainCoordinatingControllerDelegate {
    func mainCoordinatingControllerLogout() {
        switchToAuthorization()
    }
}

// MARK: - PasswordViewControllerDelegate

extension RootCoordinatingController: PasswordViewControllerDelegate {
    func passwordViewController(_ password: String) {
        updateToken(password) { success in
            if success {
                self.showMain()
            } else {
                self.showAuthorization()
            }
        }
    }
}
