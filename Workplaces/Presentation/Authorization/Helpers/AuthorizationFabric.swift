//
//  AuthorizationFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import UIKit

final class AuthorizationFabric {
    
    // MARK: - Private Properties
    
    private let registrationFabric: RegistrationFabric
    
    // MARK: - Initialization
    
    init(
        registrationFabric: RegistrationFabric
    ) {
        self.registrationFabric = registrationFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения StartViewController
    public func getStartViewController() -> StartViewController {
        return StartViewController()
    }
    
    /// Метод для получения CompletedAuthorizationViewController
    public func getLoginViewController() -> LoginViewController {
        return LoginViewController()
    }
    
    /// Метод для получения RegistrationContainerController
    public func getRegistrationContainerController() -> RegistrationContainerController {
        return RegistrationContainerController(
            registrationFabric: registrationFabric
        )
    }
    
    /// Метод для получения CompletedAuthorizationViewController
    public func getCompletedLoginViewController() -> CompletedAuthorizationViewController {
        return CompletedAuthorizationViewController()
    }
    
    /// Метод для получения UINavigationController
    public func getAuthorizationNavigationController() -> UINavigationController {
        return UINavigationController()
    }
    
}
