//
//  RootCoordinatingController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 14.05.2021.
//

import UIKit

final class RootCoordinatingController: UIViewController {
    
    // MARK: - Private Properties
    
    private let authorizationService: AuthorizationServiceProtocol
    
    private let authorizationCoordinatingController: AuthorizationCoordinatingController
    private let mainCoordinatingController: MainCoordinatingController
    
    // MARK: - Initialization
    
    init(
        authorizationService: AuthorizationServiceProtocol = ServiceLayer.shared.authorizationService,
        rootFabric: RootFabric
    ) {
        self.authorizationService = authorizationService
        
        self.authorizationCoordinatingController = rootFabric.getAuthorizationCoordinatingController()
        self.mainCoordinatingController = rootFabric.getMainCoordinatingController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if authorizationService.checkLogin() {
            showMain()
        } else {
            showAuthorization()
        }
    }
    
    // MARK: - Private methods
    
    private func showMain() {
        mainCoordinatingController.delegate = self
        showChild(mainCoordinatingController, to: view)
    }
    
    private func showAuthorization() {
        authorizationCoordinatingController.delegate = self
        showChild(authorizationCoordinatingController, to: view)
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

extension RootCoordinatingController: AuthorizationCoordinatingControllerDelegate {
    func authorizationCoordinatingControllerDone() {
        switchToMain()
    }
}

extension RootCoordinatingController: MainCoordinatingControllerDelegate {
    func mainCoordinatingControllerLogout() {
        switchToAuthorization()
    }
}
